aws_ec2_spot_fleet_request() {
    local spot-fleet-request-config="$1"
    shift 1

    cond_log_and_run aws ec2  --spot-fleet-request-config $spot_fleet_request_config "@"

}
