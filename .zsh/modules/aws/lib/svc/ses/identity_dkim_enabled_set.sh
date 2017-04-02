aws_ses_identity_dkim_enabled_set() {
    local dkim-enabled="$1"
    local identity="$2"
    shift 2

    cond_log_and_run aws ses  --dkim-enabled $dkim_enabled --identity $identity "@"

}
