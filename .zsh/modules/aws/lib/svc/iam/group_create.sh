aws_iam_group_create() {
    local group-name="$1"
    shift 1

    cond_log_and_run aws iam  --group-name $group_name "@"

}
