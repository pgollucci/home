aws_ses_configuration_set_event_destination_delete() {
    local configuration-set-name="$1"
    local event-destination-name="$2"
    shift 2

    cond_log_and_run aws ses  --configuration-set-name $configuration_set_name --event-destination-name $event_destination_name "@"

}
