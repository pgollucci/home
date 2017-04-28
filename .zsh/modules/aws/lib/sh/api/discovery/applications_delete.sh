aws_discovery_applications_delete() {
    local configuration_ids="$1"
    shift 1

    cond_log_and_run aws discovery delete-applications --configuration-ids $configuration_ids "$@"
}
