aws_waf_byte_match_set_update() {
    local byte_match_set_id="$1"
    local change_token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf update-byte-match-set --byte-match-set-id $byte_match_set_id --change-token $change_token --updates $updates "$@"
}
