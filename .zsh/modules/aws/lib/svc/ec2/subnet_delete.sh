aws_ec2_subnet_delete() {
    local subnet-id="$1"
    shift 1

    cond_log_and_run aws ec2  --subnet-id $subnet_id "@"

}
