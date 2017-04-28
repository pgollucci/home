aws_ses_identity_feedback_forwarding_enabled_set() {
    local identity="$1"
    local forwarding_enabled="$2"
    shift 2

    cond_log_and_run aws ses set-identity-feedback-forwarding-enabled --identity $identity --forwarding-enabled $forwarding_enabled "$@"
}
