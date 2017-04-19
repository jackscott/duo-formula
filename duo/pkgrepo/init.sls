{% from "duo/map.jinja" import duo with context %}
{% with family = grains['os_family']|lower %}
{% set dist = grains['oscodename'] %}
{% set os = grains['os'] %}

{% if family == 'debian' %}
duosecurity:
  pkgrepo.managed:
    - name: {{ 'deb http://pkg.duosecurity.com/%s %s main'|format(os, dist) }}
    - dist: {{ dist }}
    - comps: main
    - file: /etc/apt/sources.list.d/duosecurity.list
    - key_url: https://duo.com/APT-GPG-KEY-DUO
    - refresh_db: True
    - order: 1
{% elif family == 'redhat' %}


duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: {{ duo.repo_uri }}
    - gpgcheck: 1
    - gpgkey: https://www.duosecurity.com/RPM-GPG-KEY-DUO
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
{% endif %}
{% endwith %}

