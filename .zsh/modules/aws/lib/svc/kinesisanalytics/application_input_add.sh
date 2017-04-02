aws_kinesisanalytics_application_input_add() {
    local input="$1"
    local application-name="$2"
    local current-application-version-id="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --input $input --application-name $application_name --current-application-version-id $current_application_version_id "@"

}
