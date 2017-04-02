aws_elasticache_snapshot_copy() {
    local source-snapshot-name="$1"
    local target-snapshot-name="$2"
    shift 2

    cond_log_and_run aws elasticache  --source-snapshot-name $source_snapshot_name --target-snapshot-name $target_snapshot_name "@"

}
