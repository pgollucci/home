aws_deploy_deployment_config_create() {
    local deployment_config_name="$1"
    shift 1

    cond_log_and_run aws deploy create-deployment-config --deployment-config-name $deployment_config_name "$@"
}
