aws_ec2_vpc_peering_connection_reject() {
    local vpc_peering_connection_id="$1"
    shift 1

    cond_log_and_run aws ec2 reject-vpc-peering-connection --vpc-peering-connection-id $vpc_peering_connection_id "$@"
}
