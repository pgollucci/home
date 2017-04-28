aws_codecommit_default_branch_update() {
    local repository_name="$1"
    local default_branch_name="$2"
    shift 2

    cond_log_and_run aws codecommit update-default-branch --repository-name $repository_name --default-branch-name $default_branch_name "$@"
}
