aws_elasticbeanstalk_configuration_settings_validate() {
    local application-name="$1"
    local option-settings="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name --option-settings $option_settings "@"

}
