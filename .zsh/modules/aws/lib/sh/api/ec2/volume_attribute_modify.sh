aws_ec2_volume_attribute_modify() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws ec2 modify-volume-attribute --volume-id $volume_id "$@"
}
