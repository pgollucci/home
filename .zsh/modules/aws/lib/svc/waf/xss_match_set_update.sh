aws_waf_xss_match_set_update() {
    local xss-match-set-id="$1"
    local change-token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf  --xss-match-set-id $xss_match_set_id --change-token $change_token --updates $updates "@"

}
