aws_ec2_dhcp_options_create() {
    local dhcp-configurations="$1"
    shift 1

    cond_log_and_run aws ec2  --dhcp-configurations $dhcp_configurations "@"

}
