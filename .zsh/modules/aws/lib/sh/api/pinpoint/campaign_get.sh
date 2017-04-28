aws_pinpoint_campaign_get() {
    local application_id="$1"
    local campaign_id="$2"
    shift 2

    log_and_run aws pinpoint get-campaign --application-id $application_id --campaign-id $campaign_id "$@"
}
