aws_cloudhsm_available_zones_list() {

    log_and_run aws cloudhsm list-available-zones "$@"
}
