aws_lightsail_static_ips_get() {
    shift 0

    log_and_run aws lightsail get-static-ips "$@"
}
