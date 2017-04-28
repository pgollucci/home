aws_kinesisanalytics_application_output_delete() {
    local application_name="$1"
    local current_application_version_id="$2"
    local output_id="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics delete-application-output --application-name $application_name --current-application-version-id $current_application_version_id --output-id $output_id "$@"
}
