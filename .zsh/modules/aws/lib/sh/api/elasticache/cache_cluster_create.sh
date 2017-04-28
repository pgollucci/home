aws_elasticache_cache_cluster_create() {
    local cache_cluster_id="$1"
    shift 1

    cond_log_and_run aws elasticache create-cache-cluster --cache-cluster-id $cache_cluster_id "$@"
}
