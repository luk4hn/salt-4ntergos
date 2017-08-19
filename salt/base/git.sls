base.git.config:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.gitconfig
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://base/templates/gitconfig
