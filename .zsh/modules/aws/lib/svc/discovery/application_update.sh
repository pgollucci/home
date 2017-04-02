aws_discovery_application_update() {
    local configuration-id="$1"
    shift 1

    cond_log_and_run aws discovery  --configuration-id $configuration_id "@"

}
