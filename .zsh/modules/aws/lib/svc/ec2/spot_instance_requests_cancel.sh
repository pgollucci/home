aws_ec2_spot_instance_requests_cancel() {
    local spot-instance-request-ids="$1"
    shift 1

    cond_log_and_run aws ec2  --spot-instance-request-ids $spot_instance_request_ids "@"

}
