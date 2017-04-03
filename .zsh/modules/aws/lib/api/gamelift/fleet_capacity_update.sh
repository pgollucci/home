aws_gamelift_fleet_capacity_update() {
    local fleet_id="$1"
    shift 1

    cond_log_and_run aws gamelift update-fleet-capacity --fleet-id $fleet_id "$@"
}
