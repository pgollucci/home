
PATH=/bin:/usr/bin:/usr/local/bin
export PATH

[ -e "${HOME}/.gpg-agent-info" ] && unlink ${HOME}/.gpg-agent-info

killall -0 gpg-agent 2>/dev/null
if [ $? -eq 0 ]; then
    killall gpg-agent
    sleep 1
    killall -0 gpg-agent 2>/dev/null && killall -9 gpg-agent
fi

[ "$1" = "stop" ] && exit 0

eval `gpg-agent --daemon --write-env-file`

xset dpms 1000 1000 1000

sudo synergys --daemon -c .synergy.conf

startxfce4
