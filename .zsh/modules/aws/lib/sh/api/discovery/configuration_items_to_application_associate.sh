aws_discovery_configuration_items_to_application_associate() {
    local application_configuration_id="$1"
    local configuration_ids="$2"
    shift 2

    cond_log_and_run aws discovery associate-configuration-items-to-application --application-configuration-id $application_configuration_id --configuration-ids $configuration_ids "$@"
}
