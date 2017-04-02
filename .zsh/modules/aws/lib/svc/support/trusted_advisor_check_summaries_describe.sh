aws_support_trusted_advisor_check_summaries_describe() {
    local check-ids="$1"
    shift 1

    log_and_run aws support  --check-ids $check_ids "@"

}
