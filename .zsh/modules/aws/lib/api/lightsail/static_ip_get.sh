aws_lightsail_static_ip_get() {
    local static_ip_name="$1"
    shift 1

    log_and_run aws lightsail get-static-ip --static-ip-name $static_ip_name "$@"
}
