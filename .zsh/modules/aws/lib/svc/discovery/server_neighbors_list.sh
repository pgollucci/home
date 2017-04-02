aws_discovery_server_neighbors_list() {
    local configuration-id="$1"
    shift 1

    log_and_run aws discovery  --configuration-id $configuration_id "@"

}
