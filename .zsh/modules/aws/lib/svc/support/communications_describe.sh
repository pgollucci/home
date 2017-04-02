aws_support_communications_describe() {
    local case-id="$1"
    shift 1

    log_and_run aws support  --case-id $case_id "@"

}
