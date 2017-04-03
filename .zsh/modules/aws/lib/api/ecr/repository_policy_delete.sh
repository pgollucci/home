aws_ecr_repository_policy_delete() {
    local repository_name="$1"
    shift 1

    cond_log_and_run aws ecr delete-repository-policy --repository-name $repository_name "$@"
}
