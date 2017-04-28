aws_gamelift_alias_delete() {
    local alias_id="$1"
    shift 1

    cond_log_and_run aws gamelift delete-alias --alias-id $alias_id "$@"
}
