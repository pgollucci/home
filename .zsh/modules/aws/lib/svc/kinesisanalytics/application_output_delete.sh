aws_kinesisanalytics_application_output_delete() {
    local application-name="$1"
    local current-application-version-id="$2"
    local output-id="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --application-name $application_name --current-application-version-id $current_application_version_id --output-id $output_id "@"

}
