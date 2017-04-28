aws_ec2_subnet_delete() {
    local subnet_id="$1"
    shift 1

    cond_log_and_run aws ec2 delete-subnet --subnet-id $subnet_id "$@"
}
