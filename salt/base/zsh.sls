base.zsh.changeshell:
  user.present:
    - name: {{ pillar.get('local_user') }}
    - shell: /bin/zsh

base.zsh.ohmyzsh:
  cmd.run:
    - shell: /bin/bash
    - name: 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    - runas: {{ pillar.get('local_user') }}
    - unless: "[[ -d /home/{{ pillar.get('local_user') }}/.oh-my-zsh ]]"

base.ohmyzsh.functions:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.oh-my-zsh/custom/00-functions.zsh
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://base/templates/oh-my-zsh/00-functions.zsh

base.ohmyzsh.environment:
  file.managed:
    - name: /home/{{ pillar.get('local_user') }}/.oh-my-zsh/custom/01-environment.zsh
    - user: {{ pillar.get('local_user') }}
    - group: users
    - source: salt://base/templates/oh-my-zsh/01-environment.zsh

base.ohmyzsh.themes:
  file.recurse:
    - name: /home/{{ pillar.get('local_user') }}/.oh-my-zsh/custom/themes
    - source: salt://base/templates/oh-my-zsh/themes
    - clean: True

base.zsh.theme:
  file.replace:
    - name: /home/{{ pillar.get('local_user') }}/.zshrc
    - pattern: ^ZSH_THEME=.*
    - repl: ZSH_THEME="bullet-train"
    - append_if_not_found: True

base.zsh.plugins:
  file.replace:
    - name: /home/{{ pillar.get('local_user') }}/.zshrc
    - pattern: ^plugins=(.*)
    - repl: plugins=(git tig ssh-agent)
    - append_if_not_found: True
