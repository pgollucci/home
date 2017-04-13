aws_ec2_internet_gateway_create() {

    cond_log_and_run aws ec2 create-internet-gateway "$@"
}
