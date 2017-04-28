aws_ec2_vpc_create() {
    local cidr_block="$1"
    shift 1

    cond_log_and_run aws ec2 create-vpc --cidr-block $cidr_block "$@"
}
