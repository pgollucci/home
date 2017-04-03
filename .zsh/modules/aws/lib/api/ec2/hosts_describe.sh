aws_ec2_hosts_describe() {
    shift 0

    log_and_run aws ec2 describe-hosts "$@"
}
