aws_ec2_egress_only_internet_gateway_delete() {
    local egress_only_internet_gateway_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-egress-only-internet-gateway --egress-only-internet-gateway-id $egress_only_internet_gateway_id "$@"
}
