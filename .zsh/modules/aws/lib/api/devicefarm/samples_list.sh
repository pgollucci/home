aws_devicefarm_samples_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-samples --arn $arn "$@"
}
