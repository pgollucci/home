aws_ec2_vpc_attribute_modify() {
    local vpc-id="$1"
    shift 1

    cond_log_and_run aws ec2  --vpc-id $vpc_id "@"

}
