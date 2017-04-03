aws_iam_user_from_group_remove() {
    local group_name="$1"
    local user_name="$2"
    shift 2

    cond_log_and_run aws iam remove-user-from-group --group-name $group_name --user-name $user_name "$@"
}
