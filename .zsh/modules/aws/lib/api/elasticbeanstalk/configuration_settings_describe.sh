aws_elasticbeanstalk_configuration_settings_describe() {
    local application_name="$1"
    shift 1

    log_and_run aws elasticbeanstalk describe-configuration-settings --application-name $application_name "$@"
}
