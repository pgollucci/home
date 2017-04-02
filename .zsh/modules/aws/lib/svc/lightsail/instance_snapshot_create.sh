aws_lightsail_instance_snapshot_create() {
    local instance-snapshot-name="$1"
    local instance-name="$2"
    shift 2

    cond_log_and_run aws lightsail  --instance-snapshot-name $instance_snapshot_name --instance-name $instance_name "@"

}
