aws_cloudtrail_event_selectors_get() {
    local trail-name="$1"
    shift 1

    log_and_run aws cloudtrail  --trail-name $trail_name "@"

}
