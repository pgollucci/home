aws_ec2_spot_fleet_instances_describe() {
    local spot_fleet_request_id="$1"
    shift 1

    log_and_run aws ec2 describe-spot-fleet-instances --spot-fleet-request-id $spot_fleet_request_id "$@"
}
