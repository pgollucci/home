aws_kinesisanalytics_application_describe() {
    local application_name="$1"
    shift 1

    log_and_run aws kinesisanalytics describe-application --application-name $application_name "$@"
}
