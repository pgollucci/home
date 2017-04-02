aws_lightsail_static_ip_get() {
    local static-ip-name="$1"
    shift 1

    log_and_run aws lightsail  --static-ip-name $static_ip_name "@"

}
