aws_gamelift_runtime_configuration_update() {
    local fleet_id="$1"
    local runtime_configuration="$2"
    shift 2

    cond_log_and_run aws gamelift update-runtime-configuration --fleet-id $fleet_id --runtime-configuration $runtime_configuration "$@"
}
