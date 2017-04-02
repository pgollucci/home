aws_elasticache_cache_parameter_group_reset() {
    local cache-parameter-group-name="$1"
    shift 1

    cond_log_and_run aws elasticache  --cache-parameter-group-name $cache_parameter_group_name "@"

}
