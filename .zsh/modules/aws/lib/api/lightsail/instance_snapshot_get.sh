aws_lightsail_instance_snapshot_get() {
    local instance_snapshot_name="$1"
    shift 1

    log_and_run aws lightsail get-instance-snapshot --instance-snapshot-name $instance_snapshot_name "$@"
}
