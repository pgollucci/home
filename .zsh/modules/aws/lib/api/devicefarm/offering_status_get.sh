aws_devicefarm_offering_status_get() {
    shift 0

    log_and_run aws devicefarm get-offering-status "$@"
}
