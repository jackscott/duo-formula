# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}
{% from "duo/map.jinja" import sshd_patterns with context %}

include:
  - duo.pkgrepo

{% set pkgs = [ '%s'|format(duo.pam_duo_pkg)] %}
{% do pkgs.extend(duo.pkg_deps) %}
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


enable_duo_globally:
  file.replace:
    - name: {{ duo.pam_conf }}
    - pattern: {{ duo.enable_pattern }}
    - flags: ['MULTILINE']
    - repl: {{ duo.enable_repl|yaml }}
    - require:
        - pkg: pam_duo


enable_duo_sshd:
  file.replace:
    - name: {{ duo.pam_sshd }}
    - pattern: {{ sshd_patterns.get('pattern') }}
    - flags: ['MULTILINE']
    - repl: {{ sshd_patterns.repl|yaml }}
    - require:
        - pkg: pam_duo
