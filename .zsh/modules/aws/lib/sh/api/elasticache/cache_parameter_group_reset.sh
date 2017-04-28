aws_elasticache_cache_parameter_group_reset() {
    local cache_parameter_group_name="$1"
    shift 1

    cond_log_and_run aws elasticache reset-cache-parameter-group --cache-parameter-group-name $cache_parameter_group_name "$@"
}
