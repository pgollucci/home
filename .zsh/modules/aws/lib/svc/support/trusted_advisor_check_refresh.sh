aws_support_trusted_advisor_check_refresh() {
    local check-id="$1"
    shift 1

    cond_log_and_run aws support  --check-id $check_id "@"

}
