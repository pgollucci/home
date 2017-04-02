aws_iam_instance_profiles_for_role_list() {
    local role-name="$1"
    shift 1

    log_and_run aws iam  --role-name $role_name "@"

}
