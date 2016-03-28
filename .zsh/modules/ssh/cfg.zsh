_setup() {

  alias sshf='ssh-add -D; pkill -HUP gpg-agent'
}

zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

ssha() {
  eval `ssh-agent`
  cd ~
  ssh-add .ssh/*.{org,com}-2
  cd -
}

_setup
