aws_ec2_network_acl_entry_replace() {
    local rule-action="$1"
    local egress="$2"
    local protocol="$3"
    local rule-number="$4"
    local network-acl-id="$5"
    shift 5

    cond_log_and_run aws ec2  --rule-action $rule_action --egress $egress --protocol $protocol --rule-number $rule_number --network-acl-id $network_acl_id "@"

}
