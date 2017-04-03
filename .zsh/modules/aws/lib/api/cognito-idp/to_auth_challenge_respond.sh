aws_cognito-idp_to_auth_challenge_respond() {
    local client_id="$1"
    local challenge_name="$2"
    shift 2

    cond_log_and_run aws cognito-idp respond-to-auth-challenge --client-id $client_id --challenge-name $challenge_name "$@"
}
