aws_lightsail_operations_get() {
    shift 0

    log_and_run aws lightsail get-operations "$@"
}
