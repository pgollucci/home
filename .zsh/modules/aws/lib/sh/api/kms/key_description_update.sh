aws_kms_key_description_update() {
    local key_id="$1"
    local description="$2"
    shift 2

    cond_log_and_run aws kms update-key-description --key-id $key_id --description $description "$@"
}
