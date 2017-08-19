docker.install:
  file.managed:
    - name: /etc/docker/daemon.json
    - makedirs: True
    - source:
      - salt://docker/templates/daemon.json
  pkg.installed:
    - refresh: True
    - pkgs: [docker, docker-compose,]
  service.running:
    - name: docker
    - enable: True
    - watch:
      - file: docker.install
