aws_lightsail_instance_public_ports_open() {
    local port_info="$1"
    local instance_name="$2"
    shift 2

    cond_log_and_run aws lightsail open-instance-public-ports --port-info $port_info --instance-name $instance_name "$@"
}
