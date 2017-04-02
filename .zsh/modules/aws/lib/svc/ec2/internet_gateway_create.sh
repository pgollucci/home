aws_ec2_internet_gateway_create() {
    shift 0

    cond_log_and_run aws ec2  "@"

}
