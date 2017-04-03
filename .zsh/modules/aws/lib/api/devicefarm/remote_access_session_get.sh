aws_devicefarm_remote_access_session_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-remote-access-session --arn $arn "$@"
}
