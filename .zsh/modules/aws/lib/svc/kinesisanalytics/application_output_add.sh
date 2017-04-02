aws_kinesisanalytics_application_output_add() {
    local current-application-version-id="$1"
    local application-name="$2"
    local application-output="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --current-application-version-id $current_application_version_id --application-name $application_name --application-output $application_output "@"

}
