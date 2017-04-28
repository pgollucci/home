aws_elasticbeanstalk_environment_create() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk create-environment --application-name $application_name "$@"
}
