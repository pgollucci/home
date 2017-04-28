aws_ec2_vpn_connection_create() {
    local type="$1"
    local customer_gateway_id="$2"
    local vpn_gateway_id="$3"
    shift 3

    cond_log_and_run aws ec2 create-vpn-connection --type $type --customer-gateway-id $customer_gateway_id --vpn-gateway-id $vpn_gateway_id "$@"
}
