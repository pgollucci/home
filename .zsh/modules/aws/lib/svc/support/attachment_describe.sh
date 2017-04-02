aws_support_attachment_describe() {
    local attachment-id="$1"
    shift 1

    log_and_run aws support  --attachment-id $attachment_id "@"

}
