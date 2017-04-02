aws_elasticbeanstalk_application_delete() {
    local application-name="$1"
    shift 1

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name "@"

}
