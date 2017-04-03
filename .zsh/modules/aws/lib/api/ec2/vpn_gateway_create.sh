aws_ec2_vpn_gateway_create() {
    local type="$1"
    shift 1

    cond_log_and_run aws ec2 create-vpn-gateway --type $type "$@"
}
