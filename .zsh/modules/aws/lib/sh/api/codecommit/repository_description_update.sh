aws_codecommit_repository_description_update() {
    local repository_name="$1"
    shift 1

    cond_log_and_run aws codecommit update-repository-description --repository-name $repository_name "$@"
}
