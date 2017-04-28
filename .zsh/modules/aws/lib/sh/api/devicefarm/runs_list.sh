aws_devicefarm_runs_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-runs --arn $arn "$@"
}
