aws_apigateway_account_update() {
    shift 0

    cond_log_and_run aws apigateway update-account "$@"
}
