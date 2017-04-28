aws_iam_attached_role_policies_list() {
    local role_name="$1"
    shift 1

    log_and_run aws iam list-attached-role-policies --role-name $role_name "$@"
}
