aws_devicefarm_upload_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-upload --arn $arn "$@"
}
