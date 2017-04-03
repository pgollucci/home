aws_waf-regional_change_token_status_get() {
    local change_token="$1"
    shift 1

    log_and_run aws waf-regional get-change-token-status --change-token $change_token "$@"
}
