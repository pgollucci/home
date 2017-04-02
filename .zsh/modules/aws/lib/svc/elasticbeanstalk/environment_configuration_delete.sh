aws_elasticbeanstalk_environment_configuration_delete() {
    local application-name="$1"
    local environment-name="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name --environment-name $environment_name "@"

}
