# -*- coding: utf-8 -*-
# vim: ft=sls
{% from "duo/map.jinja" import duo with context %}

{% if duo.use_official %}
include:
  - .pkgrepo
{% endif %}

pam_duo:
  pkg.installed:
    - name: {{ duo.pam_duo_pkg }}

  file.managed:
    - name: {{ duo.config_dir }}pam_duo.conf
    - source: salt://{{ slspath }}/files/duo.conf
