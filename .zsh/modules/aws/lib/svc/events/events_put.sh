aws_events_events_put() {
    local entries="$1"
    shift 1

    cond_log_and_run aws events  --entries $entries "@"

}
