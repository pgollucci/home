aws_codebuild_build_start() {
    local project-name="$1"
    shift 1

    cond_log_and_run aws codebuild  --project-name $project_name "@"

}
