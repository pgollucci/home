aws_ec2_volume_detach() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws ec2 detach-volume --volume-id $volume_id "$@"
}
