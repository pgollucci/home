aws_kms_resource_tag() {
    local tags="$1"
    local key-id="$2"
    shift 2

    cond_log_and_run aws kms  --tags $tags --key-id $key_id "@"

}
