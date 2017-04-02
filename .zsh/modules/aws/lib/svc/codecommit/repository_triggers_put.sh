aws_codecommit_repository_triggers_put() {
    local triggers="$1"
    local repository-name="$2"
    shift 2

    cond_log_and_run aws codecommit  --triggers $triggers --repository-name $repository_name "@"

}
