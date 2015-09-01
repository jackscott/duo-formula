{% set dist = grains['oscodename'] %}
{% set os = grains['os'] %}

duosecurity:
  pkgrepo.absent:
    - name: deb http://pkg.duosecurity.com/{{ os }} {{ dist }} main
