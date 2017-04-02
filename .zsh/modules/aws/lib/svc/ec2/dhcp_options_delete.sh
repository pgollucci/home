aws_ec2_dhcp_options_delete() {
    local dhcp-options-id="$1"
    shift 1

    cond_log_and_run aws ec2  --dhcp-options-id $dhcp_options_id "@"

}
