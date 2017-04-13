aws_ecr_login_get() {

    log_and_run aws ecr get-login "$@"
}
