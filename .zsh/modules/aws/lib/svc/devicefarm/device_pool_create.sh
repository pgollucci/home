aws_devicefarm_device_pool_create() {
    local rules="$1"
    local name="$2"
    local project-arn="$3"
    shift 3

    cond_log_and_run aws devicefarm  --rules $rules --name $name --project-arn $project_arn "@"

}
