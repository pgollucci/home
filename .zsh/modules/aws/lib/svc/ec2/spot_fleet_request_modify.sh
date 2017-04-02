aws_ec2_spot_fleet_request_modify() {
    local spot-fleet-request-id="$1"
    shift 1

    cond_log_and_run aws ec2  --spot-fleet-request-id $spot_fleet_request_id "@"

}
