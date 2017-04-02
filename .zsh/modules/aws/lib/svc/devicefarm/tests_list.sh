aws_devicefarm_tests_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm  --arn $arn "@"

}
