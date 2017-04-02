aws_ses_identity_policies_list() {
    local identity="$1"
    shift 1

    log_and_run aws ses  --identity $identity "@"

}
