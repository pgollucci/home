aws_ec2_egress_only_internet_gateway_delete() {
    local egress-only-internet-gateway-id="$1"
    shift 1

    cond_log_and_run aws ec2  --egress-only-internet-gateway-id $egress_only_internet_gateway_id "@"

}
