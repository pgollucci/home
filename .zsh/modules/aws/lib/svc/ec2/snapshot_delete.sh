aws_ec2_snapshot_delete() {
    local snapshot-id="$1"
    shift 1

    cond_log_and_run aws ec2  --snapshot-id $snapshot_id "@"

}
