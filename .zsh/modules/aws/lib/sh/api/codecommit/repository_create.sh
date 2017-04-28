aws_codecommit_repository_create() {
    local repository_name="$1"
    shift 1

    cond_log_and_run aws codecommit create-repository --repository-name $repository_name "$@"
}
