aws_ec2_snapshot_copy() {
    local source-snapshot-id="$1"
    local source-region="$2"
    shift 2

    cond_log_and_run aws ec2  --source-snapshot-id $source_snapshot_id --source-region $source_region "@"

}
