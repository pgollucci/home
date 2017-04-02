aws_elasticache_cache_security_group_create() {
    local cache-security-group-name="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws elasticache  --cache-security-group-name $cache_security_group_name --description $description "@"

}
