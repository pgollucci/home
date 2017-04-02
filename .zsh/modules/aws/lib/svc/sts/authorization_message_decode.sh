aws_sts_authorization_message_decode() {
    local encoded-message="$1"
    shift 1

    cond_log_and_run aws sts  --encoded-message $encoded_message "@"

}
