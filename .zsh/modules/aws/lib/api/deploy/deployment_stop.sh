aws_deploy_deployment_stop() {
    local deployment_id="$1"
    shift 1

    cond_log_and_run aws deploy stop-deployment --deployment-id $deployment_id "$@"
}
