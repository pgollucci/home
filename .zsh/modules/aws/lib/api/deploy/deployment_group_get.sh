aws_deploy_deployment_group_get() {
    local application_name="$1"
    local deployment_group_name="$2"
    shift 2

    log_and_run aws deploy get-deployment-group --application-name $application_name --deployment-group-name $deployment_group_name "$@"
}
