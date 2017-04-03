aws_deploy_deployment_group_delete() {
    local application_name="$1"
    local deployment_group_name="$2"
    shift 2

    cond_log_and_run aws deploy delete-deployment-group --application-name $application_name --deployment-group-name $deployment_group_name "$@"
}
