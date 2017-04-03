aws_support_trusted_advisor_check_summaries_describe() {
    local check_ids="$1"
    shift 1

    log_and_run aws support describe-trusted-advisor-check-summaries --check-ids $check_ids "$@"
}
