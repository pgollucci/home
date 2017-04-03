aws_lightsail_instance_snapshots_get() {
    shift 0

    log_and_run aws lightsail get-instance-snapshots "$@"
}
