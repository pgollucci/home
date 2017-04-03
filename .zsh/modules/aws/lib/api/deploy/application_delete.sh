aws_deploy_application_delete() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws deploy delete-application --application-name $application_name "$@"
}
