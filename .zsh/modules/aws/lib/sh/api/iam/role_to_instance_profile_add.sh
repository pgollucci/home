aws_iam_role_to_instance_profile_add() {
    local instance_profile_name="$1"
    local role_name="$2"
    shift 2

    cond_log_and_run aws iam add-role-to-instance-profile --instance-profile-name $instance_profile_name --role-name $role_name "$@"
}
