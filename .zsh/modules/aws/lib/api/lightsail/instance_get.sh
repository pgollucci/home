aws_lightsail_instance_get() {
    local instance_name="$1"
    shift 1

    log_and_run aws lightsail get-instance --instance-name $instance_name "$@"
}
