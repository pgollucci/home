aws_iam_role_to_instance_profile_add() {
    local role-name="$1"
    local instance-profile-name="$2"
    shift 2

    cond_log_and_run aws iam  --role-name $role_name --instance-profile-name $instance_profile_name "@"

}
