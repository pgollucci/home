aws_ec2_network_acl_entry_replace() {
    local egress="$1"
    local network_acl_id="$2"
    local protocol="$3"
    local rule_action="$4"
    local rule_number="$5"
    shift 5

    cond_log_and_run aws ec2 replace-network-acl-entry --egress $egress --network-acl-id $network_acl_id --protocol $protocol --rule-action $rule_action --rule-number $rule_number "$@"
}
