postfix:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/mailname
      - file: /etc/postfix/main.cf

/etc/mailname:
  file:
    - managed
    - contents: {{ salt['grains.get']('fqdns')[0] }}
    - user: root
    - group: root
    - mode: 644

/etc/aliases:
  file:
    - managed
    - source: salt://core/postfix/etc/aliases
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/postfix/main.cf:
  file:
    - managed
    - source: salt://core/postfix/etc/postfix/main.cf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

regenerate_aliases:
  cmd:
    - run
    - name: /usr/bin/newaliases
    - onchanges:
      - file: /etc/aliases

