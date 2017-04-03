aws_kms_resource_tag() {
    local key_id="$1"
    local tags="$2"
    shift 2

    cond_log_and_run aws kms tag-resource --key-id $key_id --tags $tags "$@"
}
