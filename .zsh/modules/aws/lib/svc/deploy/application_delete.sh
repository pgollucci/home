aws_deploy_application_delete() {
    local application-name="$1"
    shift 1

    cond_log_and_run aws deploy  --application-name $application_name "@"

}
