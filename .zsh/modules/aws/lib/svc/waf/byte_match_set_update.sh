aws_waf_byte_match_set_update() {
    local updates="$1"
    local change-token="$2"
    local byte-match-set-id="$3"
    shift 3

    cond_log_and_run aws waf  --updates $updates --change-token $change_token --byte-match-set-id $byte_match_set_id "@"

}
