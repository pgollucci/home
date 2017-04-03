aws_ec2_vpn_gateway_detach() {
    local vpn_gateway_id="$1"
    local vpc_id="$2"
    shift 2

    cond_log_and_run aws ec2 detach-vpn-gateway --vpn-gateway-id $vpn_gateway_id --vpc-id $vpc_id "$@"
}
