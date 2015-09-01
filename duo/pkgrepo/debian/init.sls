{% set dist = grains['oscodename'] %}
{% set os = grains['os'] %}

duosecurity:
  pkgrepo.managed:
    - name: deb http://pkg.duosecurity.com/{{ os }} {{ dist }} main
    - dist: {{ dist }}
    - comps: main
    - file: /etc/apt/sources.list.d/duosecurity.list
    - key_url: https://www.duosecurity.com/APT-GPG-KEY-DUO
    - refresh_db: True
    - order: 1
