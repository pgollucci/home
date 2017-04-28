aws_lambda_event_source_mapping_get() {
    local uuid="$1"
    shift 1

    log_and_run aws lambda get-event-source-mapping --uuid $uuid "$@"
}
