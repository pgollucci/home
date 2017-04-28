aws_ec2_vpc_delete() {
    local vpc_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-vpc --vpc-id $vpc_id "$@"
}
