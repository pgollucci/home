aws_devicefarm_run_stop() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm stop-run --arn $arn "$@"
}
