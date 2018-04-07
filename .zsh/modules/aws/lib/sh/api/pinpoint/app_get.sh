aws_pinpoint_app_get() {
    local application_id="$1"
    shift 1

    log_and_run aws pinpoint get-app --application-id $application_id "$@"
}
