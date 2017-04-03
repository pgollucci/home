aws_deploy_deployment_configs_list() {
    shift 0

    log_and_run aws deploy list-deployment-configs "$@"
}
