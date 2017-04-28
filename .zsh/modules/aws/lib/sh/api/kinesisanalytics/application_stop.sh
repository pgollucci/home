aws_kinesisanalytics_application_stop() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws kinesisanalytics stop-application --application-name $application_name "$@"
}
