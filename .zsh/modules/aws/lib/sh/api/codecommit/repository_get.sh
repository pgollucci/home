aws_codecommit_repository_get() {
    local repository_name="$1"
    shift 1

    log_and_run aws codecommit get-repository --repository-name $repository_name "$@"
}
