aws_discovery_configurations_list() {
    local configuration-type="$1"
    shift 1

    log_and_run aws discovery  --configuration-type $configuration_type "@"

}
