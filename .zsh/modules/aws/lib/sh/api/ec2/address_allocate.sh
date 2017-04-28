aws_ec2_address_allocate() {

    cond_log_and_run aws ec2 allocate-address "$@"
}
