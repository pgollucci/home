aws_codestar_user_profile_create() {
    local user_arn="$1"
    local display_name="$2"
    local email_address="$3"
    shift 3

    cond_log_and_run aws codestar create-user-profile --user-arn $user_arn --display-name $display_name --email-address $email_address "$@"
}
