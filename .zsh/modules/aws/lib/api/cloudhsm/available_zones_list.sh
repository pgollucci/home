aws_cloudhsm_available_zones_list() {
    shift 0

    log_and_run aws cloudhsm list-available-zones "$@"
}
