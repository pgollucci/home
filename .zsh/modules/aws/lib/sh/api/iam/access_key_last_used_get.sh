aws_iam_access_key_last_used_get() {
    local access_key_id="$1"
    shift 1

    log_and_run aws iam get-access-key-last-used --access-key-id $access_key_id "$@"
}
