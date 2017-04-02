aws_health_event_details_describe() {
    local event-arns="$1"
    shift 1

    log_and_run aws health  --event-arns $event_arns "@"

}
