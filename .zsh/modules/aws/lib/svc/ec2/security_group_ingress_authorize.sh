aws_ec2_security_group_ingress_authorize() {
    shift 0

    cond_log_and_run aws ec2  "@"

}
