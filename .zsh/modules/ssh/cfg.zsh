alias sshf='ssh-add -D; pkill -HUP gpg-agent'
ssha() {
  eval `ssh-agent`
  cd ~
  ssh-add .ssh/*.{org,com}-2
  cd -
}
