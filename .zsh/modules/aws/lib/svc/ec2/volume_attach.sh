aws_ec2_volume_attach() {
    local instance-id="$1"
    local volume-id="$2"
    local device="$3"
    shift 3

    cond_log_and_run aws ec2  --instance-id $instance_id --volume-id $volume_id --device $device "@"

}
