aws_elasticbeanstalk_environment_configuration_delete() {
    local application_name="$1"
    local environment_name="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk delete-environment-configuration --application-name $application_name --environment-name $environment_name "$@"
}
