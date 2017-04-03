aws_discovery_tags_create() {
    local configuration_ids="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws discovery create-tags --configuration-ids $configuration_ids --tags $tags "$@"
}
