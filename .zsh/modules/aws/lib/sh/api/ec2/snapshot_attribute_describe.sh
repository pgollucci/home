aws_ec2_snapshot_attribute_describe() {
    local attribute="$1"
    local snapshot_id="$2"
    shift 2

    log_and_run aws ec2 describe-snapshot-attribute --attribute $attribute --snapshot-id $snapshot_id "$@"
}
