aws_sts_role_with_web_identity_assume() {
    local role_arn="$1"
    local role_session_name="$2"
    local web_identity_token="$3"
    shift 3

    cond_log_and_run aws sts assume-role-with-web-identity --role-arn $role_arn --role-session-name $role_session_name --web-identity-token $web_identity_token "$@"
}
