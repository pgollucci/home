aws_elasticache_snapshot_copy() {
    local source_snapshot_name="$1"
    local target_snapshot_name="$2"
    shift 2

    cond_log_and_run aws elasticache copy-snapshot --source-snapshot-name $source_snapshot_name --target-snapshot-name $target_snapshot_name "$@"
}
