ssh:
  pkg:
    - installed
{% if grains['os'] == 'Ubuntu' %}
    - name: openssh-server
{% elif grains['os'] == 'Arch' %}
    - name: openssh
{% endif %}
  service:
    - running
    - enable: True
{% if grains['os'] == 'Ubuntu' %}
    - name: ssh
{% elif grains['os'] == 'Arch' %}
    - name: sshd
{% endif %}
hef:
  ssh_auth:
    - present  
    - user: root
    - source: salt://ssh/hef.id_rsa.pub
