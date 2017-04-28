aws_devicefarm_device_pool_create() {
    local project_arn="$1"
    local name="$2"
    local rules="$3"
    shift 3

    cond_log_and_run aws devicefarm create-device-pool --project-arn $project_arn --name $name --rules $rules "$@"
}
