aws_codecommit_branches_list() {
    local repository_name="$1"
    shift 1

    log_and_run aws codecommit list-branches --repository-name $repository_name "$@"
}
