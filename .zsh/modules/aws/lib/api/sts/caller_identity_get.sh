aws_sts_caller_identity_get() {

    log_and_run aws sts get-caller-identity "$@"
}
