aws_ses_identity_policies_get() {
    local policy-names="$1"
    local identity="$2"
    shift 2

    log_and_run aws ses  --policy-names $policy_names --identity $identity "@"

}
