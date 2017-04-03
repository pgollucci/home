aws_kms_resource_untag() {
    local key_id="$1"
    local tag_keys="$2"
    shift 2

    cond_log_and_run aws kms untag-resource --key-id $key_id --tag-keys $tag_keys "$@"
}
