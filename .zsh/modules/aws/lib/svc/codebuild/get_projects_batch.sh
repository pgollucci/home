aws_codebuild_get_projects_batch() {
    local names="$1"
    shift 1

    log_and_run aws codebuild  --names $names "@"

}
