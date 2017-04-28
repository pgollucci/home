aws_devicefarm_jobs_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-jobs --arn $arn "$@"
}
