aws_support_trusted_advisor_check_refresh() {
    local check_id="$1"
    shift 1

    cond_log_and_run aws support refresh-trusted-advisor-check --check-id $check_id "$@"
}
