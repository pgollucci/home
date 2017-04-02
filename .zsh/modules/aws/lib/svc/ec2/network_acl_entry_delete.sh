aws_ec2_network_acl_entry_delete() {
    local egress="$1"
    local rule-number="$2"
    local network-acl-id="$3"
    shift 3

    cond_log_and_run aws ec2  --egress $egress --rule-number $rule_number --network-acl-id $network_acl_id "@"

}
