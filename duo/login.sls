# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}

{% if duo.use_official %}
include:
  - .pkgrepo
{% endif %}

login_duo:
  pkg.installed:
    - name: {{ duo.login_duo_pkg }}

  file.managed:
    - name: {{ duo.config_dir }}login_duo.conf
    - source: salt://{{ slspath }}/files/duo.conf
    - template: jinja
    - user: {{ duo.user }}
    - group: 'root'
    - mode: '0600'
