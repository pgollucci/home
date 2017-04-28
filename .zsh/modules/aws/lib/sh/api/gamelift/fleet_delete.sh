aws_gamelift_fleet_delete() {
    local fleet_id="$1"
    shift 1

    cond_log_and_run aws gamelift delete-fleet --fleet-id $fleet_id "$@"
}
