{% set os = grains['os'] %}
{% set release = '$releasever' %}
{%- if os == 'Amazon' %}
{% set os = 'CentOS' %}
{% set release = '6' %}
{% endif %
duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: http://pkg.duosecurity.com/{{ os }}/{{ release }}/$basearch
    - gpgcheck: 1
    - gpgkey: https://www.duosecurity.com/RPM-GPG-KEY-DUO
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
