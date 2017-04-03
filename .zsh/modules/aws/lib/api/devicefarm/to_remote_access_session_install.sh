aws_devicefarm_to_remote_access_session_install() {
    local remote_access_session_arn="$1"
    local app_arn="$2"
    shift 2

    cond_log_and_run aws devicefarm install-to-remote-access-session --remote-access-session-arn $remote_access_session_arn --app-arn $app_arn "$@"
}
