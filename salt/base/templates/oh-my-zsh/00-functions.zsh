
[ -f /etc/profile.d/autojump.zsh ] &&  . /etc/profile.d/autojump.zsh

wanip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}

## docker helper
dc.bash() {
    local _container=$1
    docker exec -ti $_container /bin/bash
}

dc.init() {
    local _name=$1
    docker run -d -ti --name $_name --hostname $_name ubuntu:14.04 /bin/bash
}

dc.ps() {
    docker ps -a
}
