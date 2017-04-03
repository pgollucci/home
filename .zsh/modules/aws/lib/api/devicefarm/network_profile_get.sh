aws_devicefarm_network_profile_get() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm get-network-profile --arn $arn "$@"
}
