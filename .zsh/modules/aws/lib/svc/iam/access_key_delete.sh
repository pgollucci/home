aws_iam_access_key_delete() {
    local access-key-id="$1"
    shift 1

    cond_log_and_run aws iam  --access-key-id $access_key_id "@"

}
