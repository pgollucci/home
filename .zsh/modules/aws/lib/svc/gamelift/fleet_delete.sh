aws_gamelift_fleet_delete() {
    local fleet-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --fleet-id $fleet_id "@"

}
