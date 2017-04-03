aws_elasticbeanstalk_configuration_template_delete() {
    local application_name="$1"
    local template_name="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk delete-configuration-template --application-name $application_name --template-name $template_name "$@"
}
