aws_ec2_dhcp_options_delete() {
    local dhcp_options_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-dhcp-options --dhcp-options-id $dhcp_options_id "$@"
}
