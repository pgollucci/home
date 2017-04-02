aws_deploy_deployment_get() {
    local deployment-id="$1"
    shift 1

    log_and_run aws deploy  --deployment-id $deployment_id "@"

}
