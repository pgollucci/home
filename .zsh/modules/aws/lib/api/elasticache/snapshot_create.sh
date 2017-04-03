aws_elasticache_snapshot_create() {
    local snapshot_name="$1"
    shift 1

    cond_log_and_run aws elasticache create-snapshot --snapshot-name $snapshot_name "$@"
}
