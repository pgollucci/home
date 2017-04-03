aws_deploy_deployment_create() {
    local application_name="$1"
    shift 1

    cond_log_and_run aws deploy create-deployment --application-name $application_name "$@"
}
