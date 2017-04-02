aws_deploy_deployment_group_delete() {
    local application-name="$1"
    local deployment-group-name="$2"
    shift 2

    cond_log_and_run aws deploy  --application-name $application_name --deployment-group-name $deployment_group_name "@"

}
