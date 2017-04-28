aws_ecr_repository_delete() {
    local repository_name="$1"
    shift 1

    cond_log_and_run aws ecr delete-repository --repository-name $repository_name "$@"
}
