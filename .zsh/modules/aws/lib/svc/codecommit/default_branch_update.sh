aws_codecommit_default_branch_update() {
    local default-branch-name="$1"
    local repository-name="$2"
    shift 2

    cond_log_and_run aws codecommit  --default-branch-name $default_branch_name --repository-name $repository_name "@"

}
