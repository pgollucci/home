aws_iam_role_from_instance_profile_remove() {
    local instance-profile-name="$1"
    local role-name="$2"
    shift 2

    cond_log_and_run aws iam  --instance-profile-name $instance_profile_name --role-name $role_name "@"

}
