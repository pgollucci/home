aws_iam_role_description_update() {
    local role_name="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws iam update-role-description --role-name $role_name --description $description "$@"
}
