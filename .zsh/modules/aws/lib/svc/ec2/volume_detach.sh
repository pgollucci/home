aws_ec2_volume_detach() {
    local volume-id="$1"
    shift 1

    cond_log_and_run aws ec2  --volume-id $volume_id "@"

}
