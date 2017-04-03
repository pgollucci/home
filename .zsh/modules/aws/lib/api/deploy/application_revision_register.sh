aws_deploy_application_revision_register() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws deploy register-application-revision --application-name $application_name "$@"
}
