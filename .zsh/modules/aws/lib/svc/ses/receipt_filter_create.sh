aws_ses_receipt_filter_create() {
    local filter="$1"
    shift 1

    cond_log_and_run aws ses  --filter $filter "@"

}
