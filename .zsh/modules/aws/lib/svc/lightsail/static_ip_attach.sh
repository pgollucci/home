aws_lightsail_static_ip_attach() {
    local instance-name="$1"
    local static-ip-name="$2"
    shift 2

    cond_log_and_run aws lightsail  --instance-name $instance_name --static-ip-name $static_ip_name "@"

}
