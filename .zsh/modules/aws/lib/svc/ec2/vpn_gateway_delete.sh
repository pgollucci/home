aws_ec2_vpn_gateway_delete() {
    local vpn-gateway-id="$1"
    shift 1

    cond_log_and_run aws ec2  --vpn-gateway-id $vpn_gateway_id "@"

}
