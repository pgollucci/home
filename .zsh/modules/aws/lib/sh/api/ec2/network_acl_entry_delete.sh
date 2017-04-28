aws_ec2_network_acl_entry_delete() {
    local network_acl_id="$1"
    local rule_number="$2"
    local egress="$3"
    shift 3

    cond_log_and_run aws ec2 delete-network-acl-entry --network-acl-id $network_acl_id --rule-number $rule_number --egress $egress "$@"
}
