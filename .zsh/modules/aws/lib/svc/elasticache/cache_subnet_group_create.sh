aws_elasticache_cache_subnet_group_create() {
    local cache-subnet-group-description="$1"
    local cache-subnet-group-name="$2"
    local subnet-ids="$3"
    shift 3

    cond_log_and_run aws elasticache  --cache-subnet-group-description $cache_subnet_group_description --cache-subnet-group-name $cache_subnet_group_name --subnet-ids $subnet_ids "@"

}
