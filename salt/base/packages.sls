base.common.packages:
  pkg.installed:
    - refresh: True
    - pkgs: [terminator, htop, dstat, zsh, git, tig, gitg, meld, tmux, curl, wget, autojump, rsync, keepass, xdotool, xsel, remmina, libvncserver, freerdp, mpv, smplayer, smplayer-skins, smplayer-themes, youtube-dl, ipcalc, pwgen, whois, traceroute, ncdu,]

base.common.purged:
  pkg.purged:
    - pkgs: [transmission-gtk, ]

base.powerline.fonts:
  git.latest:
    - name: https://github.com/powerline/fonts.git
    - target: /tmp/fonts
    - user: {{ pillar.get('local_user') }}
    - unless: "[[ -f '/home/{{ pillar.get('local_user') }}/.local/share/fonts/Ubuntu Mono derivative Powerline.ttf' ]]"
  cmd.run:
    - shell: /bin/bash
    - name: ./fonts/install.sh
    - cwd: /tmp/
    - runas: {{ pillar.get('local_user') }}
    - unless: "[[ -f '/home/{{ pillar.get('local_user') }}/.local/share/fonts/Ubuntu Mono derivative Powerline.ttf' ]]"

base.terminator.colorscheme:
    file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.config/terminator/config
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://base/templates/terminator

base.tmux.config:
    file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.tmux.conf
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://base/templates/tmux.conf
