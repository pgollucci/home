aws_ses_identity_policy_put() {
    local policy-name="$1"
    local identity="$2"
    local policy="$3"
    shift 3

    cond_log_and_run aws ses  --policy-name $policy_name --identity $identity --policy $policy "@"

}
