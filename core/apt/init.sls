/etc/apt/sources.list:
  file:
    - managed
    - source: salt://core/apt/etc/apt/sources.list
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/apt/sources.list.d/backports.list:
  file:
    - managed
    - source: salt://core/apt/etc/apt/sources.list.d/backports.list
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/apt/apt.conf:
  file:
    - managed
    - source: salt://core/apt/etc/apt/apt.conf
    - user: root
    - group: root
    - mode: 644

