aws_codecommit_differences_get() {
    local after-commit-specifier="$1"
    local repository-name="$2"
    shift 2

    log_and_run aws codecommit  --after-commit-specifier $after_commit_specifier --repository-name $repository_name "@"

}
