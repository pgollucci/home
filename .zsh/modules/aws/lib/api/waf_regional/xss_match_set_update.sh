aws_waf_regional_xss_match_set_update() {
    local xss_match_set_id="$1"
    local change_token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf-regional update-xss-match-set --xss-match-set-id $xss_match_set_id --change-token $change_token --updates $updates "$@"
}
