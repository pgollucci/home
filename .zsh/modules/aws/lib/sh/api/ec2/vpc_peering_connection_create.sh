aws_ec2_vpc_peering_connection_create() {

    cond_log_and_run aws ec2 create-vpc-peering-connection "$@"
}
