aws_cloudtrail_event_selectors_get() {
    local trail_name="$1"
    shift 1

    log_and_run aws cloudtrail get-event-selectors --trail-name $trail_name "$@"
}
