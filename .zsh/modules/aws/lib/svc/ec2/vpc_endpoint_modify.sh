aws_ec2_vpc_endpoint_modify() {
    local vpc-endpoint-id="$1"
    shift 1

    cond_log_and_run aws ec2  --vpc-endpoint-id $vpc_endpoint_id "@"

}
