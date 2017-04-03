aws_devicefarm_remote_access_session_create() {
    local project_arn="$1"
    local device_arn="$2"
    shift 2

    cond_log_and_run aws devicefarm create-remote-access-session --project-arn $project_arn --device-arn $device_arn "$@"
}
