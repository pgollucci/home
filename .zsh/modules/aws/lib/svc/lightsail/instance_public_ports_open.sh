aws_lightsail_instance_public_ports_open() {
    local port-info="$1"
    local instance-name="$2"
    shift 2

    cond_log_and_run aws lightsail  --port-info $port_info --instance-name $instance_name "@"

}
