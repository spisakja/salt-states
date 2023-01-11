set_dns_params:
  file.managed:
    - name: /etc/resolv.conf
    - contents: |
        nameserver 10.24.2.2
        domain spiru.cz
        search spiru.cz
