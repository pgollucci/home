aws_ses_configuration_set_event_destination_update() {
    local configuration_set_name="$1"
    local event_destination="$2"
    shift 2

    cond_log_and_run aws ses update-configuration-set-event-destination --configuration-set-name $configuration_set_name --event-destination $event_destination "$@"
}
