telegram.install:
  cmd.run:
    - shell: /bin/bash
    - runas: {{ pillar.get('local_user') }}
    - name: yaourt --noconfirm -S telegram-desktop-bin
    - unless: "pacman -Qsq telegram-desktop-bin"

slack.install:
  cmd.run:
    - shell: /bin/bash
    - runas: {{ pillar.get('local_user') }}
    - name: yaourt --noconfirm -S slack-desktop
    - unless: "pacman -Qsq slack-desktop"

# remove --disable-gpu option
slack.application.desktop:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.local/share/applications/slack.desktop
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://im/templates/slack.desktop
