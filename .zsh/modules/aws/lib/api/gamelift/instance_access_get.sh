aws_gamelift_instance_access_get() {
    local fleet_id="$1"
    local instance_id="$2"
    shift 2

    log_and_run aws gamelift get-instance-access --fleet-id $fleet_id --instance-id $instance_id "$@"
}
