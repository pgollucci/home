aws_iam_role_from_instance_profile_remove() {
    local instance_profile_name="$1"
    local role_name="$2"
    shift 2

    cond_log_and_run aws iam remove-role-from-instance-profile --instance-profile-name $instance_profile_name --role-name $role_name "$@"
}
