# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}

{% if duo.use_official %}
include:
  - duo.pkgrepo
{% endif %}

{% set pkgs = [ '%s'|format(duo.login_duo_pkg)] %}
{% do pkgs.extend(duo.pkg_deps) %}
login_duo:
  pkg.installed:
    - pkgs: {{ pkgs|yaml }}
    {% if duo.use_official %}
    - require:
      - sls: duo.pkgrepo
    {% endif %}
  file.managed:
    - name: {{ duo.config_dir }}/login_duo.conf
    - source: salt://{{ slspath }}/files/duo.conf
    - template: jinja
    - user: {{ duo.user }}
    - group: 'root'
    - mode: '0600'
