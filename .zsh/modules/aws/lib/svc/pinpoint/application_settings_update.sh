aws_pinpoint_application_settings_update() {
    local application-id="$1"
    local write-application-settings-request="$2"
    shift 2

    cond_log_and_run aws pinpoint  --application-id $application_id --write-application-settings-request $write_application_settings_request "@"

}
