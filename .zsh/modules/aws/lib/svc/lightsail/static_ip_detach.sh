aws_lightsail_static_ip_detach() {
    local static-ip-name="$1"
    shift 1

    cond_log_and_run aws lightsail  --static-ip-name $static_ip_name "@"

}
