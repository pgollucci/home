aws_ses_configuration_set_event_destination_update() {
    local event-destination="$1"
    local configuration-set-name="$2"
    shift 2

    cond_log_and_run aws ses  --event-destination $event_destination --configuration-set-name $configuration_set_name "@"

}
