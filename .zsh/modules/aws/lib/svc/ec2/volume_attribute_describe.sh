aws_ec2_volume_attribute_describe() {
    local volume-id="$1"
    shift 1

    log_and_run aws ec2  --volume-id $volume_id "@"

}
