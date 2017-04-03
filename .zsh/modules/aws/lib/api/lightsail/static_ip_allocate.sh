aws_lightsail_static_ip_allocate() {
    local static_ip_name="$1"
    shift 1

    cond_log_and_run aws lightsail allocate-static-ip --static-ip-name $static_ip_name "$@"
}
