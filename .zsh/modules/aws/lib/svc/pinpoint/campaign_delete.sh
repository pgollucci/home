aws_pinpoint_campaign_delete() {
    local application-id="$1"
    local campaign-id="$2"
    shift 2

    cond_log_and_run aws pinpoint  --application-id $application_id --campaign-id $campaign_id "@"

}
