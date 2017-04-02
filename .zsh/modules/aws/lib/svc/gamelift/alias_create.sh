aws_gamelift_alias_create() {
    local routing-strategy="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws gamelift  --routing-strategy $routing_strategy --name $name "@"

}
