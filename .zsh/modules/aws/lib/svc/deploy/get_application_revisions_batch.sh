aws_deploy_get_application_revisions_batch() {
    local application-name="$1"
    local revisions="$2"
    shift 2

    log_and_run aws deploy  --application-name $application_name --revisions $revisions "@"

}
