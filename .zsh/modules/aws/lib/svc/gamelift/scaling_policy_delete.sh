aws_gamelift_scaling_policy_delete() {
    local name="$1"
    local fleet-id="$2"
    shift 2

    cond_log_and_run aws gamelift  --name $name --fleet-id $fleet_id "@"

}
