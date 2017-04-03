aws_gamelift_scaling_policies_describe() {
    local fleet_id="$1"
    shift 1

    log_and_run aws gamelift describe-scaling-policies --fleet-id $fleet_id "$@"
}
