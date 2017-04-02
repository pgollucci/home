aws_deploy_application_get() {
    local application-name="$1"
    shift 1

    log_and_run aws deploy  --application-name $application_name "@"

}
