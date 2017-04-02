aws_elasticache_reserved_cache_nodes_offering_purchase() {
    local reserved-cache-nodes-offering-id="$1"
    shift 1

    cond_log_and_run aws elasticache  --reserved-cache-nodes-offering-id $reserved_cache_nodes_offering_id "@"

}
