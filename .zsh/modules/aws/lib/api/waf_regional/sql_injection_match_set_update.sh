aws_waf_regional_sql_injection_match_set_update() {
    local sql_injection_match_set_id="$1"
    local change_token="$2"
    local updates="$3"
    shift 3

    cond_log_and_run aws waf-regional update-sql-injection-match-set --sql-injection-match-set-id $sql_injection_match_set_id --change-token $change_token --updates $updates "$@"
}
