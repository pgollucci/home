aws_ec2_volume_delete() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-volume --volume-id $volume_id "$@"
}
