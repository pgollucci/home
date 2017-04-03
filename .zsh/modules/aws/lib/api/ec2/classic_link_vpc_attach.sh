aws_ec2_classic_link_vpc_attach() {
    local instance_id="$1"
    local vpc_id="$2"
    local groups="$3"
    shift 3

    cond_log_and_run aws ec2 attach-classic-link-vpc --instance-id $instance_id --vpc-id $vpc_id --groups $groups "$@"
}
