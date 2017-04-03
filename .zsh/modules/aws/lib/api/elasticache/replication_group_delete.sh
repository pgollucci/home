aws_elasticache_replication_group_delete() {
    local replication_group_id="$1"
    shift 1

    cond_log_and_run aws elasticache delete-replication-group --replication-group-id $replication_group_id "$@"
}
