aws_deploy_get_deployment_groups_batch() {
    local application-name="$1"
    local deployment-group-names="$2"
    shift 2

    log_and_run aws deploy  --application-name $application_name --deployment-group-names $deployment_group_names "@"

}
