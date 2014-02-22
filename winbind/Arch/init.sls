/etc/nsswitch.conf:
  file:
    - managed
    - source: salt://winbind/Arch/nsswitch.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/pam.d/system-auth:
  file:
    - managed
    - source: salt://winbind/Arch/pam.d_system-auth
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/pam.d/sudo:
  file:
    - managed
    - source: salt://winbind/Arch/pam.d_sudo
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/security/pam_winbind.conf:
  file:
    - managed
    - source: salt://winbind/Arch/pam_winbind.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
