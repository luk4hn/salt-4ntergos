gtk.css:
    file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/gtk-3.0/gtk.css
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://gtk/templates/gtk.css

gtk.theme.vertex.install:
  cmd.run:
    - shell: /bin/bash
    - runas: {{ pillar.get('local_user') }}
    - name: yaourt --noconfirm -S vertex-themes
    - unless: "pacman -Qsq vertex-themes"
