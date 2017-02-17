enable_duo_globaly:
  file.replace:
    - name: /etc/pam.d/system-auth
    - pattern: ^auth\s+\[success=1 default=ignore\]\s+pam_unix.so\s+nullok_secure$
    - flags: ['MULTILINE']
    - repl: |
        auth  requisite pam_unix.so nullok_secure
        auth  [success=1 default=ignore] pam_duo.so
    - require:
      - pkg: pam_duo
