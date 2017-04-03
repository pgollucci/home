aws_ec2_snapshot_attribute_reset() {
    local snapshot_id="$1"
    local attribute="$2"
    shift 2

    cond_log_and_run aws ec2 reset-snapshot-attribute --snapshot-id $snapshot_id --attribute $attribute "$@"
}
