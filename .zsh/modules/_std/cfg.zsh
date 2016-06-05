cd_make_aliases() { # args: dir
    local dir="$1"

    if [ -d $dir ]; then
	local d
	for d in $(cd $dir ; /bin/ls -1d *); do
	    eval "alias cd$d='cd $dir/$d'"
	done
    fi
}

path_if() {
    local dir=$1

    if [ -d $dir ]; then
	PATH="${PATH}:$dir"
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

pgs() {
    find . -type f | xargs perl -pi -e "s,$1,$2,g"
}

__setup() {

    default_path

    zplug "zsh-users/zsh-syntax-highlighting"
    zplug "zsh-users/zsh-completions"

    zplug "robbyrussell/oh-my-zsh", use:"lib/grep/*.zsh"
    zplug "robbyrussell/oh-my-zsh", use:"plugins/encode64/*.zsh"

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

    alias sha1="openssl dgst -sha1"
    alias sha2="openssl dgst -sha256"
    alias b64="openssl enc -base64"
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

}

slen() {
  local s="$1"

  perl -le "print length '$s'"
}

path() {

  env | grep -i path | cut -f 2 -d= | perl -F: -MData::Dumper -lane 'print Dumper \@F' | sed -e "s/[',]//g" | egrep -v '\]|\[' | grep /
}

xclean() {
    find . \( -type f -o -type l \)  -a \
	 \( \
	    -name ".DS_Store" -o \
	    -name "*.bak" -o \
	    -name "*~" -o \
	    -name ".\#*" -o \
	    -name "\#*" -o \
	    -name "*.rej" -o \
	    -name "svn-commit.*" -o \
	    -name "*.orig" -o \
	    -name "*-i" -o \
	    -name "*.tmp" -o \
	    -name "=~+*" \
	\) \
	-print -exec rm -f "{}" \;
}

mkpasswd() {
  cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c $1
  echo
}

__setup
