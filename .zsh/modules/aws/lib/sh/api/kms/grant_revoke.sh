aws_kms_grant_revoke() {
    local key_id="$1"
    local grant_id="$2"
    shift 2

    cond_log_and_run aws kms revoke-grant --key-id $key_id --grant-id $grant_id "$@"
}
