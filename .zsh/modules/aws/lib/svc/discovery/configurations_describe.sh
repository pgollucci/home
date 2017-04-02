aws_discovery_configurations_describe() {
    local configuration-ids="$1"
    shift 1

    log_and_run aws discovery  --configuration-ids $configuration_ids "@"

}
