aws_pinpoint_campaign_delete() {
    local application_id="$1"
    local campaign_id="$2"
    shift 2

    cond_log_and_run aws pinpoint delete-campaign --application-id $application_id --campaign-id $campaign_id "$@"
}
