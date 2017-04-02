aws_waf-regional_xss_match_set_update() {
    local updates="$1"
    local xss-match-set-id="$2"
    local change-token="$3"
    shift 3

    cond_log_and_run aws waf-regional  --updates $updates --xss-match-set-id $xss_match_set_id --change-token $change_token "@"

}
