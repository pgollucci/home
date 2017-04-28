aws_ec2_internet_gateway_attach() {
    local internet_gateway_id="$1"
    local vpc_id="$2"
    shift 2

    cond_log_and_run aws ec2 attach-internet-gateway --internet-gateway-id $internet_gateway_id --vpc-id $vpc_id "$@"
}
