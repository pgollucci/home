aws_devicefarm_offerings_list() {
    shift 0

    log_and_run aws devicefarm list-offerings "$@"
}
