aws_waf_byte_match_set_get() {
    local byte_match_set_id="$1"
    shift 1

    log_and_run aws waf get-byte-match-set --byte-match-set-id $byte_match_set_id "$@"
}
