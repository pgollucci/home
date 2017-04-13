aws_ec2_address_release() {

    cond_log_and_run aws ec2 release-address "$@"
}
