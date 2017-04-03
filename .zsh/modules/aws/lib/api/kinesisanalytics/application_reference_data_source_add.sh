aws_kinesisanalytics_application_reference_data_source_add() {
    local application_name="$1"
    local current_application_version_id="$2"
    local reference_data_source="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics add-application-reference-data-source --application-name $application_name --current-application-version-id $current_application_version_id --reference-data-source $reference_data_source "$@"
}
