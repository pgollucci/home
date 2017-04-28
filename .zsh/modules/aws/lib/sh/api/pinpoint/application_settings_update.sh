aws_pinpoint_application_settings_update() {
    local application_id="$1"
    local write_application_settings_request="$2"
    shift 2

    cond_log_and_run aws pinpoint update-application-settings --application-id $application_id --write-application-settings-request $write_application_settings_request "$@"
}
