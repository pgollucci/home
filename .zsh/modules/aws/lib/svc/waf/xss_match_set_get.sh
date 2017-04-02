aws_waf_xss_match_set_get() {
    local xss-match-set-id="$1"
    shift 1

    log_and_run aws waf  --xss-match-set-id $xss_match_set_id "@"

}
