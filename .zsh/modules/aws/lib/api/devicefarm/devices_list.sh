aws_devicefarm_devices_list() {
    shift 0

    log_and_run aws devicefarm list-devices "$@"
}
