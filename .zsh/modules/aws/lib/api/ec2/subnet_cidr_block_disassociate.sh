aws_ec2_subnet_cidr_block_disassociate() {
    local association_id="$1"
    shift 1

    cond_log_and_run aws ec2 disassociate-subnet-cidr-block --association-id $association_id "$@"
}
