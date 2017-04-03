aws_lightsail_instance_stop() {
    local instance_name="$1"
    shift 1

    cond_log_and_run aws lightsail stop-instance --instance-name $instance_name "$@"
}
