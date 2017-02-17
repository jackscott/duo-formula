enable_duo_sshd:
  file.replace:
    - name: /etc/pam.d/sshd
    - pattern: ^@include\s+common-auth$
    - flags: ['MULTILINE']
    - repl: |
        auth  [success=1 default=ignore] pam_duo.so
        auth  requisite pam_deny.so
        auth  required pam_permit.so
        auth  optional pam_cap.so
    - require:
      - pkg: pam_duo
