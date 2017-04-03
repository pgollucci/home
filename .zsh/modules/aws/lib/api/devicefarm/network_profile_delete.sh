aws_devicefarm_network_profile_delete() {
    local arn="$1"
    shift 1

    cond_log_and_run aws devicefarm delete-network-profile --arn $arn "$@"
}
