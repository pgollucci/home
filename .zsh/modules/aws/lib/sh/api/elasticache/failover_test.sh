aws_elasticache_failover_test() {
    local replication_group_id="$1"
    local node_group_id="$2"
    shift 2

    cond_log_and_run aws elasticache test-failover --replication-group-id $replication_group_id --node-group-id $node_group_id "$@"
}
