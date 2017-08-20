
#DEFAULT_USER=luk4hn
HISTFILE=~/.histfile
HISTSIZE=65535
SAVEHIST=999999
HIST_STAMPS="mm/dd/yyyy"
setopt appendhistory

export EDITOR=vim
export VAGRANT_HOME='/data/VMs/vagrant-home'
export GOPATH=~/Work/go
export PATH=$PATH:~/Work/go/bin

#source <(kubectl completion zsh)
#source /usr/local/bin/aws_zsh_completer.sh

alias wo=j
alias mirror-stats='curl -s http://f.archlinuxvn.org/archlinux/status.json ; curl -s http://arm.f.archlinuxvn.org/status.json'
alias pacman='sudo pacman'
alias pt='source ~/.virtualenv/pytool/bin/activate'
