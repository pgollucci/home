aws_codecommit_repository_triggers_test() {
    local repository_name="$1"
    local triggers="$2"
    shift 2

    cond_log_and_run aws codecommit test-repository-triggers --repository-name $repository_name --triggers $triggers "$@"
}
