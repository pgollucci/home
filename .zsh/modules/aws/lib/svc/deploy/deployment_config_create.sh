aws_deploy_deployment_config_create() {
    local deployment-config-name="$1"
    shift 1

    cond_log_and_run aws deploy  --deployment-config-name $deployment_config_name "@"

}
