aws_ec2_nat_gateway_delete() {
    local nat-gateway-id="$1"
    shift 1

    cond_log_and_run aws ec2  --nat-gateway-id $nat_gateway_id "@"

}
