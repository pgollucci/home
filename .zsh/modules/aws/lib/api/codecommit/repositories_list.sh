aws_codecommit_repositories_list() {
    shift 0

    log_and_run aws codecommit list-repositories "$@"
}
