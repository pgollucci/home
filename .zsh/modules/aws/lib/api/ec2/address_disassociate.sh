aws_ec2_address_disassociate() {

    cond_log_and_run aws ec2 disassociate-address "$@"
}
