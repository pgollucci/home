aws_codecommit_commit_get() {
    local repository_name="$1"
    local commit_id="$2"
    shift 2

    log_and_run aws codecommit get-commit --repository-name $repository_name --commit-id $commit_id "$@"
}
