aws_gamelift_fleet_port_settings_update() {
    local fleet-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --fleet-id $fleet_id "@"

}
