aws_support_attachment_describe() {
    local attachment_id="$1"
    shift 1

    log_and_run aws support describe-attachment --attachment-id $attachment_id "$@"
}
