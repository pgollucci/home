aws_elasticbeanstalk_application_update() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk update-application --application-name $application_name "$@"
}
