aws_ec2_network_acl_delete() {
    local network-acl-id="$1"
    shift 1

    cond_log_and_run aws ec2  --network-acl-id $network_acl_id "@"

}
