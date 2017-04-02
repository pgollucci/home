aws_discovery_configuration_items_to_application_associate() {
    local configuration-ids="$1"
    local application-configuration-id="$2"
    shift 2

    cond_log_and_run aws discovery  --configuration-ids $configuration_ids --application-configuration-id $application_configuration_id "@"

}
