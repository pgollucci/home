aws_elasticbeanstalk_configuration_template_update() {
    local application_name="$1"
    local template_name="$2"
    shift 2

    cond_log_and_run aws elasticbeanstalk update-configuration-template --application-name $application_name --template-name $template_name "$@"
}
