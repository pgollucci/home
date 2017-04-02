aws_codecommit_repository_get() {
    local repository-name="$1"
    shift 1

    log_and_run aws codecommit  --repository-name $repository_name "@"

}
