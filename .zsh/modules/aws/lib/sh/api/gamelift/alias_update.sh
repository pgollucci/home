aws_gamelift_alias_update() {
    local alias_id="$1"
    shift 1

    cond_log_and_run aws gamelift update-alias --alias-id $alias_id "$@"
}
