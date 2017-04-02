aws_gamelift_runtime_configuration_update() {
    local runtime-configuration="$1"
    local fleet-id="$2"
    shift 2

    cond_log_and_run aws gamelift  --runtime-configuration $runtime_configuration --fleet-id $fleet_id "@"

}
