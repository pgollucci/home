aws_codecommit_get_repositories_batch() {
    local repository_names="$1"
    shift 1

    log_and_run aws codecommit batch-get-repositories --repository-names $repository_names "$@"
}
