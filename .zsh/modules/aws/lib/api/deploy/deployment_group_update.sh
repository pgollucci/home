aws_deploy_deployment_group_update() {
    local application_name="$1"
    local current_deployment_group_name="$2"
    shift 2

    cond_log_and_run aws deploy update-deployment-group --application-name $application_name --current-deployment-group-name $current_deployment_group_name "$@"
}
