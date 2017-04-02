aws_ec2_customer_gateway_delete() {
    local customer-gateway-id="$1"
    shift 1

    cond_log_and_run aws ec2  --customer-gateway-id $customer_gateway_id "@"

}
