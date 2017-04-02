aws_ec2_vpn_connection_create() {
    local vpn-gateway-id="$1"
    local customer-gateway-id="$2"
    local type="$3"
    shift 3

    cond_log_and_run aws ec2  --vpn-gateway-id $vpn_gateway_id --customer-gateway-id $customer_gateway_id --type $type "@"

}
