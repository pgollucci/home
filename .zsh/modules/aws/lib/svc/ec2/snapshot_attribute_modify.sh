aws_ec2_snapshot_attribute_modify() {
    local snapshot-id="$1"
    shift 1

    cond_log_and_run aws ec2  --snapshot-id $snapshot_id "@"

}
