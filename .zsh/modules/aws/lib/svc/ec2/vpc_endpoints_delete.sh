aws_ec2_vpc_endpoints_delete() {
    local vpc-endpoint-ids="$1"
    shift 1

    cond_log_and_run aws ec2  --vpc-endpoint-ids $vpc_endpoint_ids "@"

}
