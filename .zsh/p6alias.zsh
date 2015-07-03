case "$OSTYPE" in
  freebsd*|darwin*) alias ll='ls -alFGTh' ;;
         *) alias ll='/bin/ls -alFh --color=auto' ;;
esac

alias rmrf='rm -rf'
alias cpr='cp -R'
alias mvf='mv -f'
alias bclq='bc -lq'
alias grepr='grep -R'

alias j='jobs -l'
alias h='history 25'
alias duh='du -h'

alias snapshots='\zfs list -t snapshot'
alias zdf='\zfs list'
alias zfsg='\zfs get origin,referenced,type,used,atime,checksum,compression,copies,jailed,mountpoint'
alias zls='\zfs list -H -t snapshot -o name,origin,type'
alias zfsl='zfs list -r -o name,avail,used,usedbychildren'

alias svni='svn --set-depth immediates'
alias svna='svn --set-depth infinity'

alias rtags="ctags -e -R app lib vendor tasks"
alias dstore-clean='find . -type f -name .DS_Store -print0 | xargs -0 rm'
alias whotunes='lsof -r 2 -n -P -F n -c iTunes -a -i TCP@`hostname`:3689'

alias sha1="openssl dgst -sha1"
alias sha2="openssl dgst -sha256"
alias b64="openssl enc -base64"
alias 256color="export TERM=xterm-256color"
alias prettyjson="python -mjson.tool"

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

alias whichlinux='uname -a; cat /etc/*release; cat /etc/issue'

alias flushdns='sudo dscacheutil -flushcache'

alias netstat='netstat -an -p tcp'
alias listen='netstat -an -p tcp | grep LISTEN'
alias listenu='netstat -an -p udp'
alias established='netstat -an -p tcp | grep ESTABLISHED'

alias tarx='tar -xvzof'
alias tart='tar -tvzf'

function tarz {
    name=$1
    shift
    echo tar -chzvof $name.tar.gz $*
    tar -chzvof $name.tar.gz $*
}

function ssha {
  eval `ssh-agent`
  cd ~
  ssh-add .ssh/*.{org,com}-2
  cd -
}

function xclean {
    find . \( -type f -o -type l \)  -a \
        \( \
            -name "*.bak" -o \
            -name "*~" -o \
            -name ".\#*" -o \
	    -name "\#*" -o \
            -name "*.rej" -o \
            -name "svn-commit.*" -o \
            -name "*.orig" -o \
            -name "*-i" -o \
            -name "*-E" -o \
            -name "*-e" -o \
            -name "*.tmp" -o \
	    -name "=~+*" \
        \) \
        -print -exec rm -f "{}" \;
}

function mkpasswd() {
  cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c $1
  echo
}

#alias irc_attach='screen -r irc'
#alias irc_init='screen -S irc irssi'

alias irc_attach='tmux attach -t irc'
alias irc_init='tmux new -s irc irssi'
function irc () {
  if ! irc_attach ; then
    irc_init
  fi
}

