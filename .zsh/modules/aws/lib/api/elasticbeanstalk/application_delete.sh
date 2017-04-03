aws_elasticbeanstalk_application_delete() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk delete-application --application-name $application_name "$@"
}
