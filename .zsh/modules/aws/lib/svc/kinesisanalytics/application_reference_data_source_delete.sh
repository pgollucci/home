aws_kinesisanalytics_application_reference_data_source_delete() {
    local application-name="$1"
    local current-application-version-id="$2"
    local reference-id="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --application-name $application_name --current-application-version-id $current_application_version_id --reference-id $reference_id "@"

}
