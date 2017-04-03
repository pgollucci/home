aws_elasticache_reserved_cache_nodes_offerings_describe() {
    shift 0

    log_and_run aws elasticache describe-reserved-cache-nodes-offerings "$@"
}
