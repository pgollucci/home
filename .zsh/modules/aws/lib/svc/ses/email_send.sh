aws_ses_email_send() {
    local from="$1"
    shift 1

    cond_log_and_run aws ses  --from $from "@"

}
