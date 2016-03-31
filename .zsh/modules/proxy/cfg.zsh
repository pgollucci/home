__setup() {

}

proxy_off() {

  for ev in `env |grep -i proxy`; do
    e=$(echo $ev | cut -f 1 -d =)
    echo $e
    unset $e
  done
}

proxy_prompt_info() {

  echo "proxy: [ALL_PROXY=$ALL_PROXY]"
}

__setup
