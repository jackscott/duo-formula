{%- from "duo/pkgrepo/redhat/map.jinja" import repo_uri with context %}
duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: {{ repo_uri }}
    - gpgcheck: 1
    - gpgkey: https://www.duosecurity.com/RPM-GPG-KEY-DUO
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
