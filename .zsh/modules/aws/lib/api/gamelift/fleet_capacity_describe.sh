aws_gamelift_fleet_capacity_describe() {
    shift 0

    log_and_run aws gamelift describe-fleet-capacity "$@"
}
