aws_elasticache_cache_cluster_reboot() {
    local cache-cluster-id="$1"
    local cache-node-ids-to-reboot="$2"
    shift 2

    cond_log_and_run aws elasticache  --cache-cluster-id $cache_cluster_id --cache-node-ids-to-reboot $cache_node_ids_to_reboot "@"

}
