aws_ec2_vpc_cidr_block_disassociate() {
    local association_id="$1"
    shift 1

    cond_log_and_run aws ec2 disassociate-vpc-cidr-block --association-id $association_id "$@"
}
