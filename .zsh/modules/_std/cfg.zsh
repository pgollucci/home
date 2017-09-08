blank_prompt_line() {

    echo "
"
}

rv_prompt_line() {

    echo "rv=%?"
}

dir_prompt_line() {

    echo "${green}%/${norm}"
}

std_prompt_line() {

    local tty="$cyan%l$norm"
    local user="$blue%n$norm"
    local host="$yellow%M$norm"

    echo "[$tty]$user@$host rv=%?"
}

cd_make_aliases() { # args: dir
    local dir="$1"

    if [ -d $dir ]; then
	local d
	for d in $(cd $dir ; /bin/ls -1); do
	    eval "alias cd$d='cd $dir/$d'"
	done
    fi
}

path_if() {
    local dir=$1

    if [ -d $dir ]; then
	if [ -n "$PATH" ]; then
	    PATH="${PATH}:$dir"
	else
	    PATH=$dir
	fi
    fi
}

default_path() {

    PATH=
    path_if $HOME/bin
    path_if /opt/X11/bin
    path_if /usr/local/bin
    path_if /usr/local/sbin
    path_if /usr/bin
    path_if /usr/sbin
    path_if /bin
    path_if /sbin
}

default_cd_aliases() {

    local d
    for d in $HOME/dev/repos/gh $HOME/dev/repos/gh/*; do
	cd_make_aliases "$d"
    done
}

__setup() {

    default_path
    default_cd_aliases

    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-completions"

#    zplug "robbyrussell/oh-my-zsh", use:"lib/grep/*.zsh"
#    zplug "robbyrussell/oh-my-zsh", use:"plugins/encode64/*.zsh"

    alias '_'='sudo'
    alias rmrf='rm -rf'
    alias cpr='cp -R'
    alias mvf='mv -f'
    alias bclq='bc -lq'
    alias grepr='grep -R'

    alias j='jobs -l'
    alias h='history 25'
    alias duh='du -h'
    alias history='fc -l 1'

    alias 256color="export TERM=xterm-256color"
    alias prettyjson="python -mjson.tool"

    alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

    alias whichlinux='uname -a; cat /etc/*release; cat /etc/issue'

    alias flushdns='sudo dscacheutil -flushcache'
    alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'

    alias netstat='netstat -an -p tcp'
    alias listen='netstat -an -p tcp | grep LISTEN'
    alias listenu='netstat -an -p udp'
    alias established='netstat -an -p tcp | grep ESTABLISHED'

    alias tarx='tar -xvzof'
    alias tart='tar -tvzf'

    alias -g me="| grep $USER"
    alias -g ng='| grep -v "\.git"'
    alias -g n="| grep $NAME"
}

__setup
