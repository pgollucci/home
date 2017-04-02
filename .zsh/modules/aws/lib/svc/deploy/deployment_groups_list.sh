aws_deploy_deployment_groups_list() {
    local application-name="$1"
    shift 1

    log_and_run aws deploy  --application-name $application_name "@"

}
