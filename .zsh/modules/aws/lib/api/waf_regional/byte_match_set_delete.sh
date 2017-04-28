aws_waf_regional_byte_match_set_delete() {
    local byte_match_set_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-byte-match-set --byte-match-set-id $byte_match_set_id --change-token $change_token "$@"
}
