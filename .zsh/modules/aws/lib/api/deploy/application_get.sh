aws_deploy_application_get() {
    local application_name="$1"
    shift 1

    log_and_run aws deploy get-application --application-name $application_name "$@"
}
