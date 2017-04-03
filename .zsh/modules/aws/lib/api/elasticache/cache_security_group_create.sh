aws_elasticache_cache_security_group_create() {
    local cache_security_group_name="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws elasticache create-cache-security-group --cache-security-group-name $cache_security_group_name --description $description "$@"
}
