aws_gamelift_alias_create() {
    local name="$1"
    local routing_strategy="$2"
    shift 2

    cond_log_and_run aws gamelift create-alias --name $name --routing-strategy $routing_strategy "$@"
}
