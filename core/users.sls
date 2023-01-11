wheel_group:
  group.present:
    - name: wheel
    - system: True

create_users:
  user.present:
    - name: yayo
    - fullname: Jaroslav Spisak
    - home: /home/yayo
    - uid: 1000
    - gid: 1000
    - usergroup: True
    - groups:
      - sshlogin
      - wheel
  ssh_auth.present:
    - user: yayo
    - comment: Jaroslav Spisak <jspisak@spiru.cz>
    - enc: ssh-ed25519
    - names:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBAnWC7A4OYjm8FBJDDeSCESVbUVNjhtzxB6xkNWPpr

allow_use_su_to_wheel_users:
  file.uncomment:
    - name: /etc/pam.d/su
    - regex: '.*pam_wheel.so$'
    - backup: '.old'

