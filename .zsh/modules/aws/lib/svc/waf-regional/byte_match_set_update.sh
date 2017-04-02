aws_waf-regional_byte_match_set_update() {
    local byte-match-set-id="$1"
    local change-token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf-regional  --byte-match-set-id $byte_match_set_id --change-token $change_token --updates $updates "@"

}
