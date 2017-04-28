aws_discovery_server_neighbors_list() {
    local configuration_id="$1"
    shift 1

    log_and_run aws discovery list-server-neighbors --configuration-id $configuration_id "$@"
}
