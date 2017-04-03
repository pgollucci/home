aws_iam_group_update() {
    local group_name="$1"
    shift 1

    cond_log_and_run aws iam update-group --group-name $group_name "$@"
}
