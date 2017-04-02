aws_ec2_network_acl_association_replace() {
    local association-id="$1"
    local network-acl-id="$2"
    shift 2

    cond_log_and_run aws ec2  --association-id $association_id --network-acl-id $network_acl_id "@"

}
