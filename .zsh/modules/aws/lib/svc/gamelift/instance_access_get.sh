aws_gamelift_instance_access_get() {
    local instance-id="$1"
    local fleet-id="$2"
    shift 2

    log_and_run aws gamelift  --instance-id $instance_id --fleet-id $fleet_id "@"

}
