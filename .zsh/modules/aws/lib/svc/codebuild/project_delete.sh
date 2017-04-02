aws_codebuild_project_delete() {
    local name="$1"
    shift 1

    cond_log_and_run aws codebuild  --name $name "@"

}
