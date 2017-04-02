aws_codebuild_builds_for_project_list() {
    local project-name="$1"
    shift 1

    log_and_run aws codebuild  --project-name $project_name "@"

}
