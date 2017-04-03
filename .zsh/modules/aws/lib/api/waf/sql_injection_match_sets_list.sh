aws_waf_sql_injection_match_sets_list() {
    shift 0

    log_and_run aws waf list-sql-injection-match-sets "$@"
}
