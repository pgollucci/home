aws_elasticache_cache_parameters_describe() {
    local cache-parameter-group-name="$1"
    shift 1

    log_and_run aws elasticache  --cache-parameter-group-name $cache_parameter_group_name "@"

}
