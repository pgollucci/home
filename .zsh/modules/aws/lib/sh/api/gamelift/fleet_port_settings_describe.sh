aws_gamelift_fleet_port_settings_describe() {
    local fleet_id="$1"
    shift 1

    log_and_run aws gamelift describe-fleet-port-settings --fleet-id $fleet_id "$@"
}
