aws_ec2_address_to_classic_restore() {
    local public_ip="$1"
    shift 1

    cond_log_and_run aws ec2 restore-address-to-classic --public-ip $public_ip "$@"
}
