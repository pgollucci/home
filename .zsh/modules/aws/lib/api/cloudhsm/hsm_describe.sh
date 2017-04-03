aws_cloudhsm_hsm_describe() {
    shift 0

    log_and_run aws cloudhsm describe-hsm "$@"
}
