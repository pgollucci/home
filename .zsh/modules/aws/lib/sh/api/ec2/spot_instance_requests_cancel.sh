aws_ec2_spot_instance_requests_cancel() {
    local spot_instance_request_ids="$1"
    shift 1

    cond_log_and_run aws ec2 cancel-spot-instance-requests --spot-instance-request-ids $spot_instance_request_ids "$@"
}
