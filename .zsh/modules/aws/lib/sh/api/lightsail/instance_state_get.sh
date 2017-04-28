aws_lightsail_instance_state_get() {
    local instance_name="$1"
    shift 1

    log_and_run aws lightsail get-instance-state --instance-name $instance_name "$@"
}
