aws_waf_change_token_status_get() {
    local change_token="$1"
    shift 1

    log_and_run aws waf get-change-token-status --change-token $change_token "$@"
}
