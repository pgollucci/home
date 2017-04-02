aws_ec2_spot_fleet_requests_cancel() {
    local spot-fleet-request-ids="$1"
    local terminate-instances="$2"
    shift 2

    cond_log_and_run aws ec2  --spot-fleet-request-ids $spot_fleet_request_ids --terminate-instances $terminate_instances "@"

}
