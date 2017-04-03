aws_apigateway_account_get() {
    shift 0

    log_and_run aws apigateway get-account "$@"
}
