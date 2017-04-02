aws_gamelift_alias_describe() {
    local alias-id="$1"
    shift 1

    log_and_run aws gamelift  --alias-id $alias_id "@"

}
