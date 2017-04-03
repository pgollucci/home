aws_elasticbeanstalk_configuration_settings_validate() {
    local application_name="$1"
    local option_settings="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk validate-configuration-settings --application-name $application_name --option-settings $option_settings "$@"
}
