aws_waf-regional_sql_injection_match_set_update() {
    local updates="$1"
    local change-token="$2"
    local sql-injection-match-set-id="$3"
    shift 3

    cond_log_and_run aws waf-regional  --updates $updates --change-token $change_token --sql-injection-match-set-id $sql_injection_match_set_id "@"

}
