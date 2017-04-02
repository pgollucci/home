aws_ec2_vpn_gateway_attach() {
    local vpc-id="$1"
    local vpn-gateway-id="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --vpn-gateway-id $vpn_gateway_id "@"

}
