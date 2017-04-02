aws_ec2_vpc_peering_connection_options_modify() {
    local vpc-peering-connection-id="$1"
    shift 1

    cond_log_and_run aws ec2  --vpc-peering-connection-id $vpc_peering_connection_id "@"

}
