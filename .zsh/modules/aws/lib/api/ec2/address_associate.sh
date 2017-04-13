aws_ec2_address_associate() {

    cond_log_and_run aws ec2 associate-address "$@"
}
