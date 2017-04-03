aws_ec2_snapshot_delete() {
    local snapshot_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-snapshot --snapshot-id $snapshot_id "$@"
}
