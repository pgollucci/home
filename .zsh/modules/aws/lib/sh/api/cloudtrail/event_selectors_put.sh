aws_cloudtrail_event_selectors_put() {
    local trail_name="$1"
    local event_selectors="$2"
    shift 2

    cond_log_and_run aws cloudtrail put-event-selectors --trail-name $trail_name --event-selectors $event_selectors "$@"
}
