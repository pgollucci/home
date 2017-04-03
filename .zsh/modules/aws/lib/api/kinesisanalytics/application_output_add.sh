aws_kinesisanalytics_application_output_add() {
    local application_name="$1"
    local current_application_version_id="$2"
    local application_output="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics add-application-output --application-name $application_name --current-application-version-id $current_application_version_id --application-output $application_output "$@"
}
