aws_codebuild_projects_list() {
    shift 0

    log_and_run aws codebuild list-projects "$@"
}
