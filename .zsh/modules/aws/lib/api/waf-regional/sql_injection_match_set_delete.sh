aws_waf-regional_sql_injection_match_set_delete() {
    local sql_injection_match_set_id="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf-regional delete-sql-injection-match-set --sql-injection-match-set-id $sql_injection_match_set_id --change-token $change_token "$@"
}
