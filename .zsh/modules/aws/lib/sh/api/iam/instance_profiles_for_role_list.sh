aws_iam_instance_profiles_for_role_list() {
    local role_name="$1"
    shift 1

    log_and_run aws iam list-instance-profiles-for-role --role-name $role_name "$@"
}
