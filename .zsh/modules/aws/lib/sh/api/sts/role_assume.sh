aws_sts_role_assume() {
    local role_arn="$1"
    local role_session_name="$2"
    shift 2

    cond_log_and_run aws sts assume-role --role-arn $role_arn --role-session-name $role_session_name "$@"
}
