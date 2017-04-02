aws_support_attachments_to_set_add() {
    local attachments="$1"
    shift 1

    cond_log_and_run aws support  --attachments $attachments "@"

}
