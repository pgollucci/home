aws_ecr_repository_delete() {
    local repository-name="$1"
    shift 1

    cond_log_and_run aws ecr  --repository-name $repository_name "@"

}
