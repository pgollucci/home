aws_ec2_classic_link_vpc_detach() {
    local vpc-id="$1"
    local instance-id="$2"
    shift 2

    cond_log_and_run aws ec2  --vpc-id $vpc_id --instance-id $instance_id "@"

}
