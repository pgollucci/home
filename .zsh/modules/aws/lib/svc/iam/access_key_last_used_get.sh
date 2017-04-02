aws_iam_access_key_last_used_get() {
    local access-key-id="$1"
    shift 1

    log_and_run aws iam  --access-key-id $access_key_id "@"

}
