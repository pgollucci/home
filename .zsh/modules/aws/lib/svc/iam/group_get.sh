aws_iam_group_get() {
    local group-name="$1"
    shift 1

    log_and_run aws iam  --group-name $group_name "@"

}
