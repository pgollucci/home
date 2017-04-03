aws_ec2_snapshot_copy() {
    local source_region="$1"
    local source_snapshot_id="$2"
    shift 2

    cond_log_and_run aws ec2 copy-snapshot --source-region $source_region --source-snapshot-id $source_snapshot_id "$@"
}
