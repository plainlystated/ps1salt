samba:
  pkg:
    - installed
krb5:
  pkg:
    - installed
{% if grains['os'] == 'Ubuntu' %}
    - name: krb5-user
{% endif %}

{% if 'roles' in grains %}
{% if not 'dc' in grains['roles'] %}
winbindd:
{% if grains['os'] == 'Ubuntu' %}
  pkg:
    - installed
    - name: winbind
{% endif %}
  service:
    - running
    - enable: True
{% if grains['os'] == 'Ubuntu' %}
    - name: winbind
{% endif %}
{% endif %}
{% endif %}


include:
  - .{{ grains['os'] }}
/etc/samba/smb.conf:
  file:
    - managed
{% if 'roles' in grains%}
    {% if 'dc' in grains['roles'] %}
    - source: salt://winbind/dc.smb.conf
    {% else %}
    - source: salt://winbind/smb.conf
    {% endif %}
{% endif %}
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/krb5.conf:
  file:
    - managed
    - source: salt://winbind/krb5.conf
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/hosts:
  file:
    - managed
    - source: salt://winbind/hosts
    - user: root
    - group: root
    - mode: 0644
    - template: jinja
/etc/sudoers.d/domain_admins:
  file:
    - managed
    - source: salt://winbind/sudoers_domain_admins
    - user: root
    - group: root
    - mode: 0440
    - template: jinja
