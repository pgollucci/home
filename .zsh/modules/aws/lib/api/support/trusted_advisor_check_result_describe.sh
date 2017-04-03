aws_support_trusted_advisor_check_result_describe() {
    local check_id="$1"
    shift 1

    log_and_run aws support describe-trusted-advisor-check-result --check-id $check_id "$@"
}
