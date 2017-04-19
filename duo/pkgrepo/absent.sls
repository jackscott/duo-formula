
{% if grains['os_family']|lower == 'debian' %}
{% set dist = grains['oscodename'] %}
{% set os = grains['os'] %}
duosecurity:
  pkgrepo.absent:
    - name: {{ duo.repo_uri|format({'os': os, 'dist': dist})}}
{% endif %}
