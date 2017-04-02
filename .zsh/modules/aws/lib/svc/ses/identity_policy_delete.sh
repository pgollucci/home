aws_ses_identity_policy_delete() {
    local identity="$1"
    local policy-name="$2"
    shift 2

    cond_log_and_run aws ses  --identity $identity --policy-name $policy_name "@"

}
