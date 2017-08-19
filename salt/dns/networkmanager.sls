dns.resolveconf.conf:
  file.managed:
    - name: /etc/resolvconf.conf
    - source: salt://dns/templates/resolvconf.conf
  service.running:
    - name: NetworkManager
    - enable: True
    - watch:
      - file: dns.resolveconf.conf
