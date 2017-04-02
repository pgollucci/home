aws_elasticache_replication_group_create() {
    local replication-group-description="$1"
    local replication-group-id="$2"
    shift 2

    cond_log_and_run aws elasticache  --replication-group-description $replication_group_description --replication-group-id $replication_group_id "@"

}
