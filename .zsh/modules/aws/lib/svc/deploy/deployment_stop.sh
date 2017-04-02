aws_deploy_deployment_stop() {
    local deployment-id="$1"
    shift 1

    cond_log_and_run aws deploy  --deployment-id $deployment_id "@"

}
