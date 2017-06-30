aws_ec2_vpn_gateway_attach() {
    local vpc_id="$1"
    local vpn_gateway_id="$2"
    shift 2

    cond_log_and_run aws ec2 attach-vpn-gateway --vpc-id $vpc_id --vpn-gateway-id $vpn_gateway_id "$@"
}
