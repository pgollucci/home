aws_ec2_subnet_cidr_block_associate() {
    local subnet-id="$1"
    local ipv6-cidr-block="$2"
    shift 2

    cond_log_and_run aws ec2  --subnet-id $subnet_id --ipv6-cidr-block $ipv6_cidr_block "@"

}
