aws_ses_identity_delete() {
    local identity="$1"
    shift 1

    cond_log_and_run aws ses  --identity $identity "@"

}
