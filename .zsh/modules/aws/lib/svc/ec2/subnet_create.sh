aws_ec2_subnet_create() {
    local vpc-id="$1"
    local cidr-block="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --cidr-block $cidr_block "@"

}
