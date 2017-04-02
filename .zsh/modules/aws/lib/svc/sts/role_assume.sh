aws_sts_role_assume() {
    local role-arn="$1"
    local role-session-name="$2"
    shift 2

    cond_log_and_run aws sts  --role-arn $role_arn --role-session-name $role_session_name "@"

}
