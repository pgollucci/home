aws_ec2_placement_group_create() {
    local group-name="$1"
    local strategy="$2"
    shift 2

    cond_log_and_run aws ec2  --group-name $group_name --strategy $strategy "@"

}
