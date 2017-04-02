aws_cloudtrail_event_selectors_put() {
    local event-selectors="$1"
    local trail-name="$2"
    shift 2

    cond_log_and_run aws cloudtrail  --event-selectors $event_selectors --trail-name $trail_name "@"

}
