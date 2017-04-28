aws_discovery_configurations_list() {
    local configuration_type="$1"
    shift 1

    log_and_run aws discovery list-configurations --configuration-type $configuration_type "$@"
}
