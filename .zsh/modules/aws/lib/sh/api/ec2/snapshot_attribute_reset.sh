aws_ec2_snapshot_attribute_reset() {
    local attribute="$1"
    local snapshot_id="$2"
    shift 2

    cond_log_and_run aws ec2 reset-snapshot-attribute --attribute $attribute --snapshot-id $snapshot_id "$@"
}
