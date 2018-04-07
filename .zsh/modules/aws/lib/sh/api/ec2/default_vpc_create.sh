aws_ec2_default_vpc_create() {

    cond_log_and_run aws ec2 create-default-vpc "$@"
}
