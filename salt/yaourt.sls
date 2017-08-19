yaourt.package-query:
  git.latest:
    - name: https://aur.archlinux.org/package-query.git
    - target: /tmp/package-query
    - user: {{ pillar.get('local_user') }}
    - unless: "pacman -Qs package-query"
  cmd.run:
    - shell: /bin/bash
    - name: "cd package-query && makepkg -si"
    - cwd: /tmp
    - runas: {{ pillar.get('local_user') }}
    - unless: "pacman -Qs package-query"

yaourt.yaourt:
  git.latest:
    - name: https://aur.archlinux.org/yaourt.git
    - target: /tmp/yaourt
    - user: {{ pillar.get('local_user') }}
    - unless: "pacman -Qs yaourt"
  cmd.run:
    - shell: /bin/bash
    - name: "cd yaourt && makepkg -si"
    - cwd: /tmp
    - runas: {{ pillar.get('local_user') }}
    - unless: "pacman -Qs yaourt"

