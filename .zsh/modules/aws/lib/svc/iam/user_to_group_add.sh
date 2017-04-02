aws_iam_user_to_group_add() {
    local user-name="$1"
    local group-name="$2"
    shift 2

    cond_log_and_run aws iam  --user-name $user_name --group-name $group_name "@"

}
