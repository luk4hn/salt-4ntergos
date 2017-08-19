qownnotes.pacman.conf:
  file.blockreplace:
    - name: /etc/pacman.conf
    - marker_start: "# START managed zone qownnotes"
    - marker_end: "# END managed zone qownnotes"
    - content: |
        [home_pbek_QOwnNotes_Arch_Extra]
        SigLevel = Optional TrustAll
        Server = http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Arch_Extra/$arch
    - append_if_not_found: True
    - show_changes: True

qownnotes.pacman.key:
  cmd.run:
    - shell: /bin/bash
    - name: |
        curl -sSL 'http://download.opensuse.org/repositories/home:/pbek:/QOwnNotes/Arch_Extra/x86_64/home_pbek_QOwnNotes_Arch_Extra.key' | pacman-key --add -
        pacman-key --lsign-key FFC43FC94539B8B0
    - unless: "pacman-key -f FFC43FC94539B8B0"

qownnotes.packages:
  pkg.installed:
    - refresh: True
    - pkgs: [qownnotes]
