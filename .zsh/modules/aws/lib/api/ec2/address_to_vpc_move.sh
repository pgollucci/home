aws_ec2_address_to_vpc_move() {
    local public_ip="$1"
    shift 1

    cond_log_and_run aws ec2 move-address-to-vpc --public-ip $public_ip "$@"
}
