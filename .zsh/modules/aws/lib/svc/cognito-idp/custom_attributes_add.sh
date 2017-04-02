aws_cognito-idp_custom_attributes_add() {
    local custom-attributes="$1"
    local user-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --custom-attributes $custom_attributes --user-pool-id $user_pool_id "@"

}
