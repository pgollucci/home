aws_deploy_deployment_group_update() {
    local current-deployment-group-name="$1"
    local application-name="$2"
    shift 2

    cond_log_and_run aws deploy  --current-deployment-group-name $current_deployment_group_name --application-name $application_name "@"

}
