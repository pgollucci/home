aws_ec2_security_group_delete() {

    cond_log_and_run aws ec2 delete-security-group "$@"
}
