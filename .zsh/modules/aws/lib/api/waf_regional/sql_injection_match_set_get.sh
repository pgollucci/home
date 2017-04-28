aws_waf_regional_sql_injection_match_set_get() {
    local sql_injection_match_set_id="$1"
    shift 1

    log_and_run aws waf-regional get-sql-injection-match-set --sql-injection-match-set-id $sql_injection_match_set_id "$@"
}
