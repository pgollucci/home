aws_kms_key_description_update() {
    local description="$1"
    local key-id="$2"
    shift 2

    cond_log_and_run aws kms  --description $description --key-id $key_id "@"

}
