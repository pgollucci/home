aws_kinesisanalytics_application_stop() {
    local application-name="$1"
    shift 1

    cond_log_and_run aws kinesisanalytics  --application-name $application_name "@"

}
