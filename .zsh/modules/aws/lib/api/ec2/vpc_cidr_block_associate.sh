aws_ec2_vpc_cidr_block_associate() {
    local vpc_id="$1"
    shift 1

    cond_log_and_run aws ec2 associate-vpc-cidr-block --vpc-id $vpc_id "$@"
}
