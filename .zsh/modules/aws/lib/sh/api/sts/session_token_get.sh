aws_sts_session_token_get() {

    log_and_run aws sts get-session-token "$@"
}
