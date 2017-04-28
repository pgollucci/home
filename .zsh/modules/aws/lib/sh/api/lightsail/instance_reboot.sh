aws_lightsail_instance_reboot() {
    local instance_name="$1"
    shift 1

    cond_log_and_run aws lightsail reboot-instance --instance-name $instance_name "$@"
}
