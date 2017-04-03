aws_elasticache_cache_subnet_group_modify() {
    local cache_subnet_group_name="$1"
    shift 1

    cond_log_and_run aws elasticache modify-cache-subnet-group --cache-subnet-group-name $cache_subnet_group_name "$@"
}
