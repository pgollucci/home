aws_ec2_snapshot_create() {
    local volume_id="$1"
    shift 1

    cond_log_and_run aws ec2 create-snapshot --volume-id $volume_id "$@"
}
