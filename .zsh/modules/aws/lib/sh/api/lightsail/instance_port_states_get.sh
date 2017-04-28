aws_lightsail_instance_port_states_get() {
    local instance_name="$1"
    shift 1

    log_and_run aws lightsail get-instance-port-states --instance-name $instance_name "$@"
}
