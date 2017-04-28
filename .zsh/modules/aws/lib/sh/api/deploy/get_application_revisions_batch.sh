aws_deploy_get_application_revisions_batch() {
    local application_name="$1"
    local revisions="$2"
    shift 2

    log_and_run aws deploy batch-get-application-revisions --application-name $application_name --revisions $revisions "$@"
}
