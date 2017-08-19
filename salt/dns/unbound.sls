dns.unbound.install:
  pkg.installed:
    - refresh: True
    - pkgs: [unbound]

dns.unbound.config:
  file.managed:
    - name: /etc/unbound/unbound.conf
    - source: salt://dns/templates/unbound.conf
  service.running:
    - name: unbound
    - enable: True
    - watch:
      - file: dns.unbound.config
