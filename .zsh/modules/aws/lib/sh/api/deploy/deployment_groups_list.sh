aws_deploy_deployment_groups_list() {
    local application_name="$1"
    shift 1

    log_and_run aws deploy list-deployment-groups --application-name $application_name "$@"
}
