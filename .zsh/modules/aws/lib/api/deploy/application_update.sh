aws_deploy_application_update() {
    shift 0

    cond_log_and_run aws deploy update-application "$@"
}
