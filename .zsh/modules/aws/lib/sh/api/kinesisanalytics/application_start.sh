aws_kinesisanalytics_application_start() {
    local application_name="$1"
    local input_configurations="$2"
    shift 2

    cond_log_and_run aws kinesisanalytics start-application --application-name $application_name --input-configurations $input_configurations "$@"
}
