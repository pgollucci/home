aws_ses_bounce_send() {
    local bounce-sender="$1"
    local bounced-recipient-info-list="$2"
    local original-message-id="$3"
    shift 3

    cond_log_and_run aws ses  --bounce-sender $bounce_sender --bounced-recipient-info-list $bounced_recipient_info_list --original-message-id $original_message_id "@"

}
