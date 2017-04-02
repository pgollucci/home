aws_gamelift_scaling_policies_describe() {
    local fleet-id="$1"
    shift 1

    log_and_run aws gamelift  --fleet-id $fleet_id "@"

}
