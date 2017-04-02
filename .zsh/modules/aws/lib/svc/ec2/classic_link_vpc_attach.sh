aws_ec2_classic_link_vpc_attach() {
    local groups="$1"
    local vpc-id="$2"
    local instance-id="$3"
    shift 3

    cond_log_and_run aws ec2  --groups $groups --vpc-id $vpc_id --instance-id $instance_id "@"

}
