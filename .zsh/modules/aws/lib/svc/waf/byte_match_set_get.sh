aws_waf_byte_match_set_get() {
    local byte-match-set-id="$1"
    shift 1

    log_and_run aws waf  --byte-match-set-id $byte_match_set_id "@"

}
