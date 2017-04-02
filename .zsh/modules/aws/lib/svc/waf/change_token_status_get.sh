aws_waf_change_token_status_get() {
    local change-token="$1"
    shift 1

    log_and_run aws waf  --change-token $change_token "@"

}
