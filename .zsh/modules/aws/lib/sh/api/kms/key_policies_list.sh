aws_kms_key_policies_list() {
    local key_id="$1"
    shift 1

    log_and_run aws kms list-key-policies --key-id $key_id "$@"
}
