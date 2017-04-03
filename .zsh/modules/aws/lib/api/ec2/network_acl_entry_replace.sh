aws_ec2_network_acl_entry_replace() {
    local network_acl_id="$1"
    local rule_number="$2"
    local protocol="$3"
    local rule_action="$4"
    local egress="$5"
    shift 5

    cond_log_and_run aws ec2 replace-network-acl-entry --network-acl-id $network_acl_id --rule-number $rule_number --protocol $protocol --rule-action $rule_action --egress $egress "$@"
}
