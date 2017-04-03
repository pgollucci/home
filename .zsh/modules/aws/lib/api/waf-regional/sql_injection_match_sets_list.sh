aws_waf-regional_sql_injection_match_sets_list() {
    shift 0

    log_and_run aws waf-regional list-sql-injection-match-sets "$@"
}
