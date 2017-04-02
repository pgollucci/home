aws_lightsail_instance_port_states_get() {
    local instance-name="$1"
    shift 1

    log_and_run aws lightsail  --instance-name $instance_name "@"

}
