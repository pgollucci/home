aws_support_trusted_advisor_check_refresh_statuses_describe() {
    local check_ids="$1"
    shift 1

    log_and_run aws support describe-trusted-advisor-check-refresh-statuses --check-ids $check_ids "$@"
}
