aws_devicefarm_network_profile_update() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm update-network-profile --arn $arn "$@"
}
