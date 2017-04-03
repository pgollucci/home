aws_waf_sql_injection_match_set_create() {
    local name="$1"
    local change_token="$2"
    shift 2

    cond_log_and_run aws waf create-sql-injection-match-set --name $name --change-token $change_token "$@"
}
