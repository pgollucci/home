aws_deploy_deployment_get() {
    local deployment_id="$1"
    shift 1

    log_and_run aws deploy get-deployment --deployment-id $deployment_id "$@"
}
