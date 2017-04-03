aws_elasticache_cache_subnet_groups_describe() {
    shift 0

    log_and_run aws elasticache describe-cache-subnet-groups "$@"
}
