aws_codebuild_projects_list() {

    log_and_run aws codebuild list-projects "$@"
}
