ntp:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ntp.conf

/etc/ntp.conf:
  file:
    - managed
    - source: salt://core/ntp/etc/ntp.conf
    - user: root
    - group: root
    - mode: 644

