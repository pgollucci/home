aws_ec2_vpc_create() {
    local cidr-block="$1"
    shift 1

    cond_log_and_run aws ec2  --cidr-block $cidr_block "@"

}
