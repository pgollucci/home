aws_elasticache_cache_cluster_modify() {
    local cache-cluster-id="$1"
    shift 1

    cond_log_and_run aws elasticache  --cache-cluster-id $cache_cluster_id "@"

}
