aws_deploy_deployment_instances_list() {
    local deployment_id="$1"
    shift 1

    log_and_run aws deploy list-deployment-instances --deployment-id $deployment_id "$@"
}
