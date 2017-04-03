aws_ec2_classic_link_vpc_detach() {
    local instance_id="$1"
    local vpc_id="$2"
    shift 2

    cond_log_and_run aws ec2 detach-classic-link-vpc --instance-id $instance_id --vpc-id $vpc_id "$@"
}
