aws_pinpoint_campaign_version_get() {
    local application_id="$1"
    local campaign_id="$2"
    local campaign_version="$3"
    shift 3

    log_and_run aws pinpoint get-campaign-version --application-id $application_id --campaign-id $campaign_id --campaign-version $campaign_version "$@"
}
