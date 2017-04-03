aws_ec2_address_disassociate() {
    shift 0

    cond_log_and_run aws ec2 disassociate-address "$@"
}
