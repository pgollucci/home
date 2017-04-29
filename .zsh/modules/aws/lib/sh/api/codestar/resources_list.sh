aws_codestar_resources_list() {
    local project_id="$1"
    shift 1

    log_and_run aws codestar list-resources --project-id $project_id "$@"
}
