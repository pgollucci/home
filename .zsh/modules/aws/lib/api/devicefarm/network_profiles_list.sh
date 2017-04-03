aws_devicefarm_network_profiles_list() {
    local arn="$1"
    shift 1

    log_and_run aws devicefarm list-network-profiles --arn $arn "$@"
}
