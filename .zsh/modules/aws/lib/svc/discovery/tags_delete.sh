aws_discovery_tags_delete() {
    local configuration-ids="$1"
    shift 1

    cond_log_and_run aws discovery  --configuration-ids $configuration_ids "@"

}
