aws_ec2_egress_only_internet_gateway_create() {
    local vpc_id="$1"
    shift 1

    cond_log_and_run aws ec2 create-egress-only-internet-gateway --vpc-id $vpc_id "$@"
}
