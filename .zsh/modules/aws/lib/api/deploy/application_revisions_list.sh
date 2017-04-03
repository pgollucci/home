aws_deploy_application_revisions_list() {
    local application_name="$1"
    shift 1

    log_and_run aws deploy list-application-revisions --application-name $application_name "$@"
}
