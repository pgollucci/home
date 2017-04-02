aws_elasticache_replication_group_delete() {
    local replication-group-id="$1"
    shift 1

    cond_log_and_run aws elasticache  --replication-group-id $replication_group_id "@"

}
