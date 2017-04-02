aws_kms_resource_untag() {
    local tag-keys="$1"
    local key-id="$2"
    shift 2

    cond_log_and_run aws kms  --tag-keys $tag_keys --key-id $key_id "@"

}
