aws_ec2_address_allocate() {
    shift 0

    cond_log_and_run aws ec2  "@"

}
