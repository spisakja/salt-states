wheel_group:
  group.present:
    - name: wheel
    - system: True

{% for user, data in pillar.get('users', {}).items() %}
{{ user }}:
  user.present:
    - fullname: {{ data.fullname }}

    {% if data.home is defined %}
    - home: {{ data.home }}
    {% endif %}

    {% if data.uid is defined %}
    - uid: {{ data.uid }}
    {% endif %}

    {% if data.gid is defined %}
    - gid: {{ data.gid }}
    {% endif %}

    - usergroup: {{ data.usergroup|default('True', true) }}

    {% if data.groups is defined %}
    - groups:
      {% for group in data.groups %}
      - {{ group }}
      {% endfor %}
    {% endif %}

  {% if data.ssh_keys is defined %}
  ssh_auth.present:
    - user: {{ user }}
    - names:
      {% for ssh_key in data.ssh_keys %}
      - {{ ssh_key }}
      {% endfor %}
  {% endif %}

{% endfor %}

allow_use_su_to_wheel_users:
  file.uncomment:
    - name: /etc/pam.d/su
    - regex: '.*pam_wheel.so$'
    - backup: '.old'

