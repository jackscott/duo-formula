enable_duo_globaly:
  file.replace:
    - name: /etc/pam.d/system-auth
    - pattern: ^auth\s+sufficient\s+pam_unix.so\s+nullok\s+try_first_pass$
    - flags: ['MULTILINE']
    - repl: |
        auth  requisite pam_unix.so nullok try_first_pass
        auth  sufficient pam_duo.so
    - require:
      - pkg: pam_duo
