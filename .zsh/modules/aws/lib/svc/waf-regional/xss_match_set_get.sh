aws_waf-regional_xss_match_set_get() {
    local xss-match-set-id="$1"
    shift 1

    log_and_run aws waf-regional  --xss-match-set-id $xss_match_set_id "@"

}
