aws_devicefarm_project_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-project --arn $arn "$@"
}
