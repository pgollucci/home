aws_ec2_placement_group_delete() {
    local group-name="$1"
    shift 1

    cond_log_and_run aws ec2  --group-name $group_name "@"

}
