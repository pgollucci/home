aws_lightsail_instance_snapshot_delete() {
    local instance_snapshot_name="$1"
    shift 1

    cond_log_and_run aws lightsail delete-instance-snapshot --instance-snapshot-name $instance_snapshot_name "$@"
}
