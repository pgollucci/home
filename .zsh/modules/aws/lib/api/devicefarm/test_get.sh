aws_devicefarm_test_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-test --arn $arn "$@"
}
