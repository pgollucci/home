aws_ses_identity_policy_put() {
    local identity="$1"
    local policy_name="$2"
    local policy="$3"
    shift 3

    cond_log_and_run aws ses put-identity-policy --identity $identity --policy-name $policy_name --policy $policy "$@"
}
