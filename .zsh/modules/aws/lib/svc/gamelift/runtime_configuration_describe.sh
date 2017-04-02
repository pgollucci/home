aws_gamelift_runtime_configuration_describe() {
    local fleet-id="$1"
    shift 1

    log_and_run aws gamelift  --fleet-id $fleet_id "@"

}
