aws_cloudhsm_hapgs_list() {
    shift 0

    log_and_run aws cloudhsm list-hapgs "$@"
}
