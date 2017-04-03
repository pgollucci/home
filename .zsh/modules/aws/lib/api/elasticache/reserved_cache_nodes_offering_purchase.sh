aws_elasticache_reserved_cache_nodes_offering_purchase() {
    local reserved_cache_nodes_offering_id="$1"
    shift 1

    cond_log_and_run aws elasticache purchase-reserved-cache-nodes-offering --reserved-cache-nodes-offering-id $reserved_cache_nodes_offering_id "$@"
}
