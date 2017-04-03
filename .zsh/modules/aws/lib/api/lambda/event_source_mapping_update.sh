aws_lambda_event_source_mapping_update() {
    local uuid="$1"
    shift 1

    cond_log_and_run aws lambda update-event-source-mapping --uuid $uuid "$@"
}
