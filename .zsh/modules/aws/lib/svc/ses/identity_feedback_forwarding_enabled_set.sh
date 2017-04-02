aws_ses_identity_feedback_forwarding_enabled_set() {
    local forwarding-enabled="$1"
    local identity="$2"
    shift 2

    cond_log_and_run aws ses  --forwarding-enabled $forwarding_enabled --identity $identity "@"

}
