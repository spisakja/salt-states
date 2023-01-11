install_openssh_packages:
  pkg:
    - installed
    - names:
      - openssh-server
      - openssh-client

/etc/ssh/sshd_config:
  file:
    - managed
    - source: salt://core/ssh/etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
        ipaddr: {{ salt['network.ipaddrs']()[0] }}

ssh:
  service:
    - running
    - enable: True
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config

