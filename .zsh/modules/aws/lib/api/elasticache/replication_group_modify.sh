aws_elasticache_replication_group_modify() {
    local replication_group_id="$1"
    shift 1

    cond_log_and_run aws elasticache modify-replication-group --replication-group-id $replication_group_id "$@"
}
