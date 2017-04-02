aws_kinesisanalytics_application_reference_data_source_add() {
    local reference-data-source="$1"
    local application-name="$2"
    local current-application-version-id="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --reference-data-source $reference_data_source --application-name $application_name --current-application-version-id $current_application_version_id "@"

}
