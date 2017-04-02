aws_elasticbeanstalk_configuration_template_create() {
    local application-name="$1"
    local template-name="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk  --application-name $application_name --template-name $template_name "@"

}
