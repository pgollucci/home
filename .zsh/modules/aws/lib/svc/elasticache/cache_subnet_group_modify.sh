aws_elasticache_cache_subnet_group_modify() {
    local cache-subnet-group-name="$1"
    shift 1

    cond_log_and_run aws elasticache  --cache-subnet-group-name $cache_subnet_group_name "@"

}
