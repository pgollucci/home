aws_devicefarm_run_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-run --arn $arn "$@"
}
