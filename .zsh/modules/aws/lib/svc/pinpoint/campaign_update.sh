aws_pinpoint_campaign_update() {
    local application-id="$1"
    local write-campaign-request="$2"
    local campaign-id="$3"
    shift 3

    cond_log_and_run aws pinpoint  --application-id $application_id --write-campaign-request $write_campaign_request --campaign-id $campaign_id "@"

}
