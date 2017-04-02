aws_codecommit_branches_list() {
    local repository-name="$1"
    shift 1

    log_and_run aws codecommit  --repository-name $repository_name "@"

}
