aws_ec2_subnet_cidr_block_associate() {
    local ipv6_cidr_block="$1"
    local subnet_id="$2"
    shift 2

    cond_log_and_run aws ec2 associate-subnet-cidr-block --ipv6-cidr-block $ipv6_cidr_block --subnet-id $subnet_id "$@"
}
