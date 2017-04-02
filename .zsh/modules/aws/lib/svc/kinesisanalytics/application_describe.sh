aws_kinesisanalytics_application_describe() {
    local application-name="$1"
    shift 1

    log_and_run aws kinesisanalytics  --application-name $application_name "@"

}
