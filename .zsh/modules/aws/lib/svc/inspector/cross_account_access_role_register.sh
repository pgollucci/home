aws_inspector_cross_account_access_role_register() {
    local role-arn="$1"
    shift 1

    cond_log_and_run aws inspector  --role-arn $role_arn "@"

}
