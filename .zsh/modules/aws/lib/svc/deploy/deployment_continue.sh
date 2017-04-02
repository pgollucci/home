aws_deploy_deployment_continue() {
    shift 0

    cond_log_and_run aws deploy  "@"

}
