aws_waf-regional_sql_injection_match_set_get() {
    local sql-injection-match-set-id="$1"
    shift 1

    log_and_run aws waf-regional  --sql-injection-match-set-id $sql_injection_match_set_id "@"

}
