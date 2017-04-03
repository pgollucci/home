aws_discovery_export_configurations_describe() {
    shift 0

    log_and_run aws discovery describe-export-configurations "$@"
}
