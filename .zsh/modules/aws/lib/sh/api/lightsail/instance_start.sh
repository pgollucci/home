aws_lightsail_instance_start() {
    local instance_name="$1"
    shift 1

    cond_log_and_run aws lightsail start-instance --instance-name $instance_name "$@"
}
