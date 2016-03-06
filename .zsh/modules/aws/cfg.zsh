__setup() {

}

sts_prompt_info() {

    local creds=$HOME/.aws/credentials

    [ -e $creds ] || return
    
    local mtime=$(stat -f "%m" $creds)
    local now=$(date "+%s")
    local diff=$(($now-$mtime))

    if [ $diff -gt 2800 ]; then
	echo "sts: ${red}$diff${norm}s"
    else
	echo "sts: ${green}$diff${norm}s"
    fi
}

__setup
