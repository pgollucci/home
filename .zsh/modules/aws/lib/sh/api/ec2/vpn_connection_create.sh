aws_ec2_vpn_connection_create() {
    local customer_gateway_id="$1"
    local type="$2"
    local vpn_gateway_id="$3"
    shift 3

    cond_log_and_run aws ec2 create-vpn-connection --customer-gateway-id $customer_gateway_id --type $type --vpn-gateway-id $vpn_gateway_id "$@"
}
