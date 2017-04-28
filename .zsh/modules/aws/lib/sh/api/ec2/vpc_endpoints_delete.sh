aws_ec2_vpc_endpoints_delete() {
    local vpc_endpoint_ids="$1"
    shift 1

    cond_log_and_run aws ec2 delete-vpc-endpoints --vpc-endpoint-ids $vpc_endpoint_ids "$@"
}
