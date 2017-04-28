aws_discovery_configuration_items_from_application_disassociate() {
    local application_configuration_id="$1"
    local configuration_ids="$2"
    shift 2

    cond_log_and_run aws discovery disassociate-configuration-items-from-application --application-configuration-id $application_configuration_id --configuration-ids $configuration_ids "$@"
}
