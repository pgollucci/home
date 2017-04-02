aws_gamelift_alias_resolve() {
    local alias-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --alias-id $alias_id "@"

}
