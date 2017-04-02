aws_cognito-idp_to_auth_challenge_respond() {
    local challenge-name="$1"
    local client-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --challenge-name $challenge_name --client-id $client_id "@"

}
