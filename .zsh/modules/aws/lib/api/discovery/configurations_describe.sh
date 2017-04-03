aws_discovery_configurations_describe() {
    local configuration_ids="$1"
    shift 1

    log_and_run aws discovery describe-configurations --configuration-ids $configuration_ids "$@"
}
