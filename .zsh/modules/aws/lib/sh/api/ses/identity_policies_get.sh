aws_ses_identity_policies_get() {
    local identity="$1"
    local policy_names="$2"
    shift 2

    log_and_run aws ses get-identity-policies --identity $identity --policy-names $policy_names "$@"
}
