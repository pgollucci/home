aws_discovery_application_update() {
    local configuration_id="$1"
    shift 1

    cond_log_and_run aws discovery update-application --configuration-id $configuration_id "$@"
}
