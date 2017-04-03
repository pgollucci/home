aws_ec2_dhcp_options_associate() {
    local dhcp_options_id="$1"
    local vpc_id="$2"
    shift 2

    cond_log_and_run aws ec2 associate-dhcp-options --dhcp-options-id $dhcp_options_id --vpc-id $vpc_id "$@"
}
