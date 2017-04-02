aws_pinpoint_campaign_create() {
    local write-campaign-request="$1"
    local application-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --write-campaign-request $write_campaign_request --application-id $application_id "@"

}
