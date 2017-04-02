aws_deploy_deployment_group_get() {
    local deployment-group-name="$1"
    local application-name="$2"
    shift 2

    log_and_run aws deploy  --deployment-group-name $deployment_group_name --application-name $application_name "@"

}
