aws_ecr_login_get() {
    shift 0

    log_and_run aws ecr get-login "$@"
}
