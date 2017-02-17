# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}
include:
{% if salt['pillar.get']('duo:pam_global', False) %}
  - .{{ grains['os_family']|lower }}.global
{%- else %}
  - .{{ grains['os_family']|lower }}.sshd
{%- endif %}
{% if duo.use_official %}
  - duo.pkgrepo
{% endif %}

pam_duo:
  pkg.installed:
    - name: {{ duo.pam_duo_pkg }}

  file.managed:
    - name: {{ duo.config_dir }}pam_duo.conf
    - source: salt://duo/files/duo.conf
    - template: jinja
    - user: 'root'
    - group: 'root'
    - mode: '0600'
