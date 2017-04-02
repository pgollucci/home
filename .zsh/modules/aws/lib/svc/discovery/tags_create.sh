aws_discovery_tags_create() {
    local tags="$1"
    local configuration-ids="$2"
    shift 2

    cond_log_and_run aws discovery  --tags $tags --configuration-ids $configuration_ids "@"

}
