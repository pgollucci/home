aws_ec2_spot_fleet_request_history_describe() {
    local spot-fleet-request-id="$1"
    local start-time="$2"
    shift 2

    log_and_run aws ec2  --spot-fleet-request-id $spot_fleet_request_id --start-time $start_time "@"

}
