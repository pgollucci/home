aws_elasticache_engine_default_parameters_describe() {
    local cache_parameter_group_family="$1"
    shift 1

    log_and_run aws elasticache describe-engine-default-parameters --cache-parameter-group-family $cache_parameter_group_family "$@"
}
