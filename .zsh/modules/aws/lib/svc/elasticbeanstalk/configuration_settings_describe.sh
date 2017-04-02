aws_elasticbeanstalk_configuration_settings_describe() {
    local application-name="$1"
    shift 1

    log_and_run aws elasticbeanstalk  --application-name $application_name "@"

}
