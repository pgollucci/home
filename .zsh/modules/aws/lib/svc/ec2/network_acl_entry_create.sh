aws_ec2_network_acl_entry_create() {
    local egress="$1"
    local rule-action="$2"
    local network-acl-id="$3"
    local protocol="$4"
    local rule-number="$5"
    shift 5

    cond_log_and_run aws ec2  --egress $egress --rule-action $rule_action --network-acl-id $network_acl_id --protocol $protocol --rule-number $rule_number "@"

}
