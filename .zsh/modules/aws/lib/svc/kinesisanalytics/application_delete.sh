aws_kinesisanalytics_application_delete() {
    local application-name="$1"
    local create-timestamp="$2"
    shift 2

    cond_log_and_run aws kinesisanalytics  --application-name $application_name --create-timestamp $create_timestamp "@"

}
