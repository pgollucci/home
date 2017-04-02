aws_devicefarm_upload_delete() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm  --arn $arn "@"

}
