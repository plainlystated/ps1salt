avahi:
  pkg:
    - installed
    {% if grains['os'] == 'Ubuntu' %}
    - name: avahi-daemon
    {% endif %}
  service:
    - running
    - enable: True
    - name: avahi-daemon
#TODO set disallow-other-stacks=yes in /etc/avahi/avahi-daemon
