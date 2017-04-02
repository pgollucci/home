aws_kms_grant_revoke() {
    local key-id="$1"
    local grant-id="$2"
    shift 2

    cond_log_and_run aws kms  --key-id $key_id --grant-id $grant_id "@"

}
