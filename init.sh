#!/bin/bash

sudo pacman -Syu

sudo pacman -S salt

echo "file_client: local" | sudo tee /etc/salt/minion
echo "state_output: changes" | sudo tee -a /etc/salt/minion
echo -e "providers:\n  service: systemd" | sudo tee -a /etc/salt/minion 

sudo ln -svf $(pwd)/salt /srv/salt
sudo ln -svf $(pwd)/pillar /srv/pillar

#sudo salt-call --local state.apply
