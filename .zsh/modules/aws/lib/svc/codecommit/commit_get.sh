aws_codecommit_commit_get() {
    local commit-id="$1"
    local repository-name="$2"
    shift 2

    log_and_run aws codecommit  --commit-id $commit_id --repository-name $repository_name "@"

}
