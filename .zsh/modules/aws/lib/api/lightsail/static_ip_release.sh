aws_lightsail_static_ip_release() {
    local static_ip_name="$1"
    shift 1

    cond_log_and_run aws lightsail release-static-ip --static-ip-name $static_ip_name "$@"
}
