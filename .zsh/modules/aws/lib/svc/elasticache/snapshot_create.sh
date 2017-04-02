aws_elasticache_snapshot_create() {
    local snapshot-name="$1"
    shift 1

    cond_log_and_run aws elasticache  --snapshot-name $snapshot_name "@"

}
