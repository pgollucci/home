aws_codecommit_branch_create() {
    local commit-id="$1"
    local repository-name="$2"
    local branch-name="$3"
    shift 3

    cond_log_and_run aws codecommit  --commit-id $commit_id --repository-name $repository_name --branch-name $branch_name "@"

}
