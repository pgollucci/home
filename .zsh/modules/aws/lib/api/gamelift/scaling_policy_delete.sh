aws_gamelift_scaling_policy_delete() {
    local name="$1"
    local fleet_id="$2"
    shift 2

    cond_log_and_run aws gamelift delete-scaling-policy --name $name --fleet-id $fleet_id "$@"
}
