aws_deploy_deployment_config_delete() {
    local deployment_config_name="$1"
    shift 1

    cond_log_and_run aws deploy delete-deployment-config --deployment-config-name $deployment_config_name "$@"
}
