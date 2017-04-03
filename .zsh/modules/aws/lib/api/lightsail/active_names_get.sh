aws_lightsail_active_names_get() {
    shift 0

    log_and_run aws lightsail get-active-names "$@"
}
