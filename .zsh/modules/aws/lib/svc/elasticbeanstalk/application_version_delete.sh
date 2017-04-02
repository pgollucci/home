aws_elasticbeanstalk_application_version_delete() {
    local application-name="$1"
    local version-label="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name --version-label $version_label "@"

}
