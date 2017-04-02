aws_cognito-idp_respond_to_auth_challenge_admin() {
    local user-pool-id="$1"
    local challenge-name="$2"
    local client-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --user-pool-id $user_pool_id --challenge-name $challenge_name --client-id $client_id "@"

}
