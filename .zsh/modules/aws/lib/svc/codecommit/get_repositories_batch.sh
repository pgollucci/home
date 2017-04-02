aws_codecommit_get_repositories_batch() {
    local repository-names="$1"
    shift 1

    log_and_run aws codecommit  --repository-names $repository_names "@"

}
