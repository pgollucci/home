aws_ec2_subnet_cidr_block_associate() {
    local subnet_id="$1"
    local ipv6_cidr_block="$2"
    shift 2

    cond_log_and_run aws ec2 associate-subnet-cidr-block --subnet-id $subnet_id --ipv6-cidr-block $ipv6_cidr_block "$@"
}
