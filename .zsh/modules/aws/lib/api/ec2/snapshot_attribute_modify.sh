aws_ec2_snapshot_attribute_modify() {
    local snapshot_id="$1"
    shift 1

    cond_log_and_run aws ec2 modify-snapshot-attribute --snapshot-id $snapshot_id "$@"
}
