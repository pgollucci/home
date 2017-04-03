aws_ec2_placement_group_delete() {
    local group_name="$1"
    shift 1

    cond_log_and_run aws ec2 delete-placement-group --group-name $group_name "$@"
}
