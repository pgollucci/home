aws_elasticache_cache_parameter_group_create() {
    local cache-parameter-group-family="$1"
    local description="$2"
    local cache-parameter-group-name="$3"
    shift 3

    cond_log_and_run aws elasticache  --cache-parameter-group-family $cache_parameter_group_family --description $description --cache-parameter-group-name $cache_parameter_group_name "@"

}
