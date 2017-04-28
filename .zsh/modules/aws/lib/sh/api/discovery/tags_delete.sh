aws_discovery_tags_delete() {
    local configuration_ids="$1"
    shift 1

    cond_log_and_run aws discovery delete-tags --configuration-ids $configuration_ids "$@"
}
