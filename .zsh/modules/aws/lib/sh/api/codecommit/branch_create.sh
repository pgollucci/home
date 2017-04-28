aws_codecommit_branch_create() {
    local repository_name="$1"
    local branch_name="$2"
    local commit_id="$3"
    shift 3

    cond_log_and_run aws codecommit create-branch --repository-name $repository_name --branch-name $branch_name --commit-id $commit_id "$@"
}
