aws_ec2_volume_attach() {
    local volume_id="$1"
    local instance_id="$2"
    local device="$3"
    shift 3

    cond_log_and_run aws ec2 attach-volume --volume-id $volume_id --instance-id $instance_id --device $device "$@"
}
