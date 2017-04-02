aws_devicefarm_to_remote_access_session_install() {
    local app-arn="$1"
    local remote-access-session-arn="$2"
    shift 2

    cond_log_and_run aws devicefarm  --app-arn $app_arn --remote-access-session-arn $remote_access_session_arn "@"

}
