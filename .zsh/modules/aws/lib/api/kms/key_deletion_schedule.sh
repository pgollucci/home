aws_kms_key_deletion_schedule() {
    local key_id="$1"
    shift 1

    cond_log_and_run aws kms schedule-key-deletion --key-id $key_id "$@"
}
