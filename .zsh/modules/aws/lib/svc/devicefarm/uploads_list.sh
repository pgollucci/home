aws_devicefarm_uploads_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm  --arn $arn "@"

}
