alias v='vagrant'

function pgup {
  scp $1 byss.dca1.rws:public_html/uploads/$1
}

function dns {
  dns=$(dig $1 +short)
  sudo sh -c "echo $dns $1 >> /etc/hosts"
  tail -1 /etc/hosts
}

function pcizip {
  zip -r $1.zip $1
  g add $1.zip
  g ci -m "zip $1"
  g push
}
