aws_ses_receipt_filter_delete() {
    local filter-name="$1"
    shift 1

    cond_log_and_run aws ses  --filter-name $filter_name "@"

}
