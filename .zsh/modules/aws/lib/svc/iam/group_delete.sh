aws_iam_group_delete() {
    local group-name="$1"
    shift 1

    cond_log_and_run aws iam  --group-name $group_name "@"

}
