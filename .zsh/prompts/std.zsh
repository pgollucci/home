prompt_line() {

    local tty="$cyan%l$norm"
    local user="$blue%n$norm"
    local host="$yellow%M$norm"

    prompt_info="[$tty]$user@$host"
}

prompt_line
