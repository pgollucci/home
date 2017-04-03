aws_ec2_volume_io_enable() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws ec2 enable-volume-io --volume-id $volume_id "$@"
}
