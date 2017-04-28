aws_iam_group_delete() {
    local group_name="$1"
    shift 1

    cond_log_and_run aws iam delete-group --group-name $group_name "$@"
}
