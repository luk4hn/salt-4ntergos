sublime.install:
  cmd.run:
    - shell: /bin/bash
    - runas: {{ pillar.get('local_user') }}
    - name: yaourt --noconfirm -S sublime-text-dev
    - unless: "pacman -Qsq sublime-text-dev"

sublime.package-control:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Installed Packages/Package Control.sublime-package
    - source:
      - https://packagecontrol.io/Package%20Control.sublime-package
    - user: {{ pillar.get('local_user') }}
    - group: users
    - mode: 644
    - skip_verify: True

sublime.theme.predawn:
  git.latest:
    - name: https://github.com/jamiewilson/predawn.git
    - target: /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Packages/Predawn
    - user: {{ pillar.get('local_user') }}
    - unless: "[[ -d /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Packages/Predawn ]]"
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Packages/User/predawn-DEV.sublime-theme
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://editor/templates/predawn-DEV.sublime-theme

sublime.colorscheme.solarized-high-contrast:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Packages/User/Solarized (Dark high contrast).tmTheme
    - source:
      - https://raw.githubusercontent.com/bmaupin/solarized-dark-high-contrast/master/sublime-text/Solarized%20(Dark%20high%20contrast).tmTheme
    - user: {{ pillar.get('local_user') }}
    - group: users
    - mode: 644
    - skip_verify: True

sublime.config:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://editor/templates/Preferences.sublime-settings
