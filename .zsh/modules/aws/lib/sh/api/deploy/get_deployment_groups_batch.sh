aws_deploy_get_deployment_groups_batch() {
    local application_name="$1"
    local deployment_group_names="$2"
    shift 2

    log_and_run aws deploy batch-get-deployment-groups --application-name $application_name --deployment-group-names $deployment_group_names "$@"
}
