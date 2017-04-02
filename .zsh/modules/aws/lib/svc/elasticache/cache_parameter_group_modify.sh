aws_elasticache_cache_parameter_group_modify() {
    local parameter-name-values="$1"
    local cache-parameter-group-name="$2"
    shift 2

    cond_log_and_run aws elasticache  --parameter-name-values $parameter_name_values --cache-parameter-group-name $cache_parameter_group_name "@"

}
