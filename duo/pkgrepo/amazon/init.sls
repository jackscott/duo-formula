duosecurity:
  pkgrepo.managed:
    - humanname: Duo Security Repository
    - baseurl: http://pkg.duosecurity.com/CentOS/6/$basearch
    - gpgcheck: 1
    - gpgkey: https://www.duosecurity.com/RPM-GPG-KEY-DUO
    - skip_if_unavailable: True
    - enabled: 1
    - order: 1
