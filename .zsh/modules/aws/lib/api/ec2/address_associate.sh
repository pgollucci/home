aws_ec2_address_associate() {
    shift 0

    cond_log_and_run aws ec2 associate-address "$@"
}
