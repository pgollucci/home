aws_lightsail_instance_snapshot_delete() {
    local instance-snapshot-name="$1"
    shift 1

    cond_log_and_run aws lightsail  --instance-snapshot-name $instance_snapshot_name "@"

}
