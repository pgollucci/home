aws_lightsail_static_ip_detach() {
    local static_ip_name="$1"
    shift 1

    cond_log_and_run aws lightsail detach-static-ip --static-ip-name $static_ip_name "$@"
}
