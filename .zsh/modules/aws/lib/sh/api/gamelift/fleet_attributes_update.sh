aws_gamelift_fleet_attributes_update() {
    local fleet_id="$1"
    shift 1

    cond_log_and_run aws gamelift update-fleet-attributes --fleet-id $fleet_id "$@"
}
