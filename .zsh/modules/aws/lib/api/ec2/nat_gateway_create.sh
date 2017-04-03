aws_ec2_nat_gateway_create() {
    local subnet_id="$1"
    local allocation_id="$2"
    shift 2

    cond_log_and_run aws ec2 create-nat-gateway --subnet-id $subnet_id --allocation-id $allocation_id "$@"
}
