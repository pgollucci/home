aws_devicefarm_remote_access_sessions_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-remote-access-sessions --arn $arn "$@"
}
