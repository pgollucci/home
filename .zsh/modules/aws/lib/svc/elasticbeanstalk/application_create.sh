aws_elasticbeanstalk_application_create() {
    local application-name="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name "@"

}
