aws_devicefarm_remote_access_session_create() {
    local project-arn="$1"
    local device-arn="$2"
    shift 2

    cond_log_and_run aws devicefarm  --project-arn $project_arn --device-arn $device_arn "@"

}
