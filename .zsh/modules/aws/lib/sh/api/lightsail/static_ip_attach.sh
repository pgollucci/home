aws_lightsail_static_ip_attach() {
    local static_ip_name="$1"
    local instance_name="$2"
    shift 2

    cond_log_and_run aws lightsail attach-static-ip --static-ip-name $static_ip_name --instance-name $instance_name "$@"
}
