aws_ec2_internet_gateway_detach() {
    local vpc-id="$1"
    local internet-gateway-id="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --internet-gateway-id $internet_gateway_id "@"

}
