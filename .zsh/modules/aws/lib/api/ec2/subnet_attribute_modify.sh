aws_ec2_subnet_attribute_modify() {
    local subnet_id="$1"
    shift 1

    cond_log_and_run aws ec2 modify-subnet-attribute --subnet-id $subnet_id "$@"
}
