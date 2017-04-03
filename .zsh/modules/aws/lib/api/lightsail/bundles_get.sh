aws_lightsail_bundles_get() {
    shift 0

    log_and_run aws lightsail get-bundles "$@"
}
