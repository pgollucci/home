aws_cloudhsm_hsms_list() {
    shift 0

    log_and_run aws cloudhsm list-hsms "$@"
}
