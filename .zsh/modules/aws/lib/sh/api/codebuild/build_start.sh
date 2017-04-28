aws_codebuild_build_start() {
    local project_name="$1"
    shift 1

    cond_log_and_run aws codebuild start-build --project-name $project_name "$@"
}
