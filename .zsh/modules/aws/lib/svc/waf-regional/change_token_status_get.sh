aws_waf-regional_change_token_status_get() {
    local change-token="$1"
    shift 1

    log_and_run aws waf-regional  --change-token $change_token "@"

}
