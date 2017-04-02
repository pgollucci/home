aws_devicefarm_remote_access_session_delete() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm  --arn $arn "@"

}
