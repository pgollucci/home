aws_elasticache_engine_default_parameters_describe() {
    local cache-parameter-group-family="$1"
    shift 1

    log_and_run aws elasticache  --cache-parameter-group-family $cache_parameter_group_family "@"

}
