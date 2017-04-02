aws_deploy_deployment_group_create() {
    local service-role-arn="$1"
    local application-name="$2"
    local deployment-group-name="$3"
    shift 3

    cond_log_and_run aws deploy  --service-role-arn $service_role_arn --application-name $application_name --deployment-group-name $deployment_group_name "@"

}
