aws_pinpoint_campaign_version_get() {
    local application-id="$1"
    local campaign-version="$2"
    local campaign-id="$3"
    shift 3

    log_and_run aws pinpoint  --application-id $application_id --campaign-version $campaign_version --campaign-id $campaign_id "@"

}
