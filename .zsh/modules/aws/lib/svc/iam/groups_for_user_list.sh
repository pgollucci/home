aws_iam_groups_for_user_list() {
    local user-name="$1"
    shift 1

    log_and_run aws iam  --user-name $user_name "@"

}
