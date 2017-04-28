aws_iam_access_key_update() {
    local access_key_id="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws iam update-access-key --access-key-id $access_key_id --status $status "$@"
}
