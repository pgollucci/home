aws_devicefarm_network_profile_create() {
    local project_arn="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws devicefarm create-network-profile --project-arn $project_arn --name $name "$@"
}
