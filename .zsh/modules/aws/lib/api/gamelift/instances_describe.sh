aws_gamelift_instances_describe() {
    local fleet_id="$1"
    shift 1

    log_and_run aws gamelift describe-instances --fleet-id $fleet_id "$@"
}
