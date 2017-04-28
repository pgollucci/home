aws_ecr_authorization_token_get() {

    log_and_run aws ecr get-authorization-token "$@"
}
