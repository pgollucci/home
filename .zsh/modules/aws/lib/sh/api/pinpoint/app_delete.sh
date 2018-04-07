aws_pinpoint_app_delete() {
    local application_id="$1"
    shift 1

    cond_log_and_run aws pinpoint delete-app --application-id $application_id "$@"
}
