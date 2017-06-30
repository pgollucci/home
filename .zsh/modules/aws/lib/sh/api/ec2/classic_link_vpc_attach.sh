aws_ec2_classic_link_vpc_attach() {
    local groups="$1"
    local instance_id="$2"
    local vpc_id="$3"
    shift 3

    cond_log_and_run aws ec2 attach-classic-link-vpc --groups $groups --instance-id $instance_id --vpc-id $vpc_id "$@"
}
