aws_elasticache_snapshot_delete() {
    local snapshot_name="$1"
    shift 1

    cond_log_and_run aws elasticache delete-snapshot --snapshot-name $snapshot_name "$@"
}
