aws_waf-regional_xss_match_set_delete() {
    local xss_match_set_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-xss-match-set --xss-match-set-id $xss_match_set_id --change-token $change_token "$@"
}
