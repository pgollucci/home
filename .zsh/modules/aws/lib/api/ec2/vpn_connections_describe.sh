aws_ec2_vpn_connections_describe() {
    shift 0

    log_and_run aws ec2 describe-vpn-connections "$@"
}
