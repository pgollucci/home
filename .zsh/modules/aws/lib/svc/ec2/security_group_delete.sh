aws_ec2_security_group_delete() {
    shift 0

    cond_log_and_run aws ec2  "@"

}
