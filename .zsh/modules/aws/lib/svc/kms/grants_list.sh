aws_kms_grants_list() {
    local key-id="$1"
    shift 1

    log_and_run aws kms  --key-id $key_id "@"

}
