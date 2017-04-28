aws_kinesisanalytics_application_delete() {
    local application_name="$1"
    local create_timestamp="$2"
    shift 2

    cond_log_and_run aws kinesisanalytics delete-application --application-name $application_name --create-timestamp $create_timestamp "$@"
}
