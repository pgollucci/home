aws_elasticache_replication_group_create() {
    local replication_group_id="$1"
    local replication_group_description="$2"
    shift 2

    cond_log_and_run aws elasticache create-replication-group --replication-group-id $replication_group_id --replication-group-description $replication_group_description "$@"
}
