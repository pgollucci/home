aws_iam_attached_user_policies_list() {
    local user_name="$1"
    shift 1

    log_and_run aws iam list-attached-user-policies --user-name $user_name "$@"
}
