aws_ecr_repository_policy_get() {
    local repository_name="$1"
    shift 1

    log_and_run aws ecr get-repository-policy --repository-name $repository_name "$@"
}
