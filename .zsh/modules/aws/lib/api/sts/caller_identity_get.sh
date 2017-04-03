aws_sts_caller_identity_get() {
    shift 0

    log_and_run aws sts get-caller-identity "$@"
}
