aws_deploy_deployment_config_get() {
    local deployment-config-name="$1"
    shift 1

    log_and_run aws deploy  --deployment-config-name $deployment_config_name "@"

}
