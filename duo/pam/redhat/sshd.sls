{%- from "duo/pam/redhat/sshd_map.jinja" import sshd_patterns with context %}
{%- set pattern = sshd_patterns.get(salt['grains.get']('osmajorrelease'), False) %}
{%- if not pattern %}
{%- set pattern = sshd_patterns.get('default') %}
{%- endif %}
enable_duo_sshd:
  file.replace:
    - name: /etc/pam.d/sshd
    - pattern: {{ pattern.get('pattern') }}
    - flags: ['MULTILINE']
    - repl: |
        {{ pattern.get('repl') }}
    - require:
      - pkg: pam_duo
