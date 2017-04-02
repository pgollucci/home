aws_waf-regional_sql_injection_match_set_delete() {
    local change-token="$1"
    local sql-injection-match-set-id="$2"
    shift 2

    cond_log_and_run aws waf-regional  --change-token $change_token --sql-injection-match-set-id $sql_injection_match_set_id "@"

}
