aws_ec2_dhcp_options_associate() {
    local vpc-id="$1"
    local dhcp-options-id="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --dhcp-options-id $dhcp_options_id "@"

}
