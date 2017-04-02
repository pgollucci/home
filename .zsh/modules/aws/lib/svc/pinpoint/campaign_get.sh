aws_pinpoint_campaign_get() {
    local campaign-id="$1"
    local application-id="$2"
    shift 2

    log_and_run aws pinpoint  --campaign-id $campaign_id --application-id $application_id "@"

}
