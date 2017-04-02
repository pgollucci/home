aws_kinesisanalytics_application_start() {
    local application-name="$1"
    local input-configurations="$2"
    shift 2

    cond_log_and_run aws kinesisanalytics  --application-name $application_name --input-configurations $input_configurations "@"

}
