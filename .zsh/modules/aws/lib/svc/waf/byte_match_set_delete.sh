aws_waf_byte_match_set_delete() {
    local byte-match-set-id="$1"
    local change-token="$2"
    shift 2

    cond_log_and_run aws waf  --byte-match-set-id $byte_match_set_id --change-token $change_token "@"

}
