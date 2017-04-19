# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}
{% from "duo/map.jinja" import regex_patterns as rp with context %}

include:
  - duo.pkgrepo

{% set pkgs = [ '%s'|format(duo.pam_duo_pkg)] %}
{% do pkgs.extend(duo.pkg_deps) %}
duo-setup:
  file.directory:
    - name: {{ duo.config_dir }}
    - user: root
    - group: root
    - mode: 755

pam_duo:
  pkg.installed:
    - pkgs: {{ pkgs|yaml }}
        
  file.managed:
    - name: {{ duo.config_dir }}/pam_duo.conf
    - source: salt://duo/files/duo.conf
    - template: jinja
    - user: 'root'
    - group: 'root'
    - mode: '0600'
    - force: true
    - replace: true
    - require:
        - pkg: pam_duo
        - file: duo-setup

enable_duo_globally:
  file.replace:
    - name: {{ duo.pam_conf }}
    - pattern: {{ rp['global_auth_pattern']|yaml }}
    - flags: ['MULTILINE']
    - repl: {{ rp['global_auth_repl']|yaml }}
    - append_if_not_found: true
    - require:
        - file: pam_duo

enable_duo_sshd:
  file.replace:
    - name: {{ duo.pam_sshd }}
    - pattern: {{ rp['pattern']|yaml }}
    - flags: ['MULTILINE']
    - repl: {{ rp['repl']|yaml }}
    - append_if_not_found: true
    - require:
        - file: pam_duo
