aws_waf_sql_injection_match_set_update() {
    local change-token="$1"
    local updates="$2"
    local sql-injection-match-set-id="$3"
    shift 3

    cond_log_and_run aws waf  --change-token $change_token --updates $updates --sql-injection-match-set-id $sql_injection_match_set_id "@"

}
