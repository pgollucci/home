aws_ec2_network_interfaces_describe() {
    shift 0

    log_and_run aws ec2 describe-network-interfaces "$@"
}
