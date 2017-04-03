aws_elasticache_cache_parameters_describe() {
    local cache_parameter_group_name="$1"
    shift 1

    log_and_run aws elasticache describe-cache-parameters --cache-parameter-group-name $cache_parameter_group_name "$@"
}
