aws_sts_authorization_message_decode() {
    local encoded_message="$1"
    shift 1

    cond_log_and_run aws sts decode-authorization-message --encoded-message $encoded_message "$@"
}
