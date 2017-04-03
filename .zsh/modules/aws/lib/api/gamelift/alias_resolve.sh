aws_gamelift_alias_resolve() {
    local alias_id="$1"
    shift 1

    cond_log_and_run aws gamelift resolve-alias --alias-id $alias_id "$@"
}
