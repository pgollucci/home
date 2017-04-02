aws_kinesisanalytics_application_update() {
    local application-update="$1"
    local current-application-version-id="$2"
    local application-name="$3"
    shift 3

    cond_log_and_run aws kinesisanalytics  --application-update $application_update --current-application-version-id $current_application_version_id --application-name $application_name "@"

}
