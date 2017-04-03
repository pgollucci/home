aws_devicefarm_suite_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-suite --arn $arn "$@"
}
