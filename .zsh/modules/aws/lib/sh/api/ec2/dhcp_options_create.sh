aws_ec2_dhcp_options_create() {
    local dhcp_configurations="$1"
    shift 1

    cond_log_and_run aws ec2 create-dhcp-options --dhcp-configurations $dhcp_configurations "$@"
}
