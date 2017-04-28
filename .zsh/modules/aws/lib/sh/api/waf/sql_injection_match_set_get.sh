aws_waf_sql_injection_match_set_get() {
    local sql_injection_match_set_id="$1"
    shift 1

    log_and_run aws waf get-sql-injection-match-set --sql-injection-match-set-id $sql_injection_match_set_id "$@"
}
