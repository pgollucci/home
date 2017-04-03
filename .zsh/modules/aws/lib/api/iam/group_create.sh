aws_iam_group_create() {
    local group_name="$1"
    shift 1

    cond_log_and_run aws iam create-group --group-name $group_name "$@"
}
