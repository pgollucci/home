aws_ses_bounce_send() {
    local original_message_id="$1"
    local bounce_sender="$2"
    local bounced_recipient_info_list="$3"
    shift 3

    cond_log_and_run aws ses send-bounce --original-message-id $original_message_id --bounce-sender $bounce_sender --bounced-recipient-info-list $bounced_recipient_info_list "$@"
}
