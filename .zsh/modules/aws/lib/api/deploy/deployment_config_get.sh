aws_deploy_deployment_config_get() {
    local deployment_config_name="$1"
    shift 1

    log_and_run aws deploy get-deployment-config --deployment-config-name $deployment_config_name "$@"
}
