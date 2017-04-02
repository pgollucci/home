aws_gamelift_fleet_port_settings_describe() {
    local fleet-id="$1"
    shift 1

    log_and_run aws gamelift  --fleet-id $fleet_id "@"

}
