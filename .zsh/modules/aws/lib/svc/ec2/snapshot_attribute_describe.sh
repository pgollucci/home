aws_ec2_snapshot_attribute_describe() {
    local snapshot-id="$1"
    local attribute="$2"
    shift 2

    log_and_run aws ec2  --snapshot-id $snapshot_id --attribute $attribute "@"

}
