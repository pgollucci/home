aws_deploy_application_update() {

    cond_log_and_run aws deploy update-application "$@"
}
