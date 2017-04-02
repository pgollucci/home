aws_ec2_vpc_cidr_block_disassociate() {
    local association-id="$1"
    shift 1

    cond_log_and_run aws ec2  --association-id $association_id "@"

}
